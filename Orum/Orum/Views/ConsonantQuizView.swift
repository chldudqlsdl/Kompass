//
//  ConsonantQuizView.swift
//  Orum
//
//  Created by Youngbin Choi on 10/23/23.
//

import SwiftUI

struct ConsonantQuizView: View {
    
    @State var hangulUnit : HangulUnit
    @State var isOptionClicked : Bool = false
    @State var clickedOptionIndex : Int = 5
    @State var answerIndex : Int = 5
    @State var isSubmitAnswer : Bool = false
    @State var optionAlphabet : [Character] = []
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color(uiColor: UIColor(hex: "F2F2F7")).edgesIgnoringSafeArea(.all)
                VStack{
                    ZStack{
                        VStack{
                            HStack{
                                Spacer()
                                Text("\(hangulUnit.unitIndex + 1)/\(hangulUnit.hangulCards.count)")
                                    .fontWeight(.bold)
                                    .font(.body)
                                    .foregroundStyle(Color(UIColor(hex: "D1D1D6")))
                            }
                            ZStack(alignment: .leading){
                                Text(hangulUnit.hangulCards[hangulUnit.unitIndex].quiz.prefix(1))
                                    .fontWeight(.bold)
                                    .font(.system(size: 105))
                                    .padding(.bottom, 10)
                                    .foregroundColor(.clear)
                                    .underline(true, color: .black)
                                    .offset(y: 10)
                                Text(hangulUnit.hangulCards[hangulUnit.unitIndex].quiz)
                                    .fontWeight(.bold)
                                    .font(.system(size: 105))
                                    .padding(.bottom, 10)
                            }
                            let qandaStatus = fetchQandaStatus()
                            Text(qandaStatus.text)
                                .fontWeight(.bold)
                                .font(.body)
                                .foregroundStyle(qandaStatus.color)
                        }
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 20, trailing: 10))
                    }
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 15.0))
                    ForEach(0..<optionAlphabet.count, id: \.self) { index in
                        let status = optionStatus(index: index)
                        let optionColor = fetchOptionColor(status: status)
                        ZStack{
                            HStack(spacing: 20){
                                Circle()
                                    .strokeBorder(.blue, lineWidth: 3)
                                    .frame(width: 20, height: 20)
                                    .overlay {
                                        Circle()
                                            .frame(width: 20, height: 20)
                                            .foregroundStyle(optionColor.circle)
                                    }
                                ZStack{
                                    Text("\(String(optionAlphabet[index]))")
                                        .fontWeight(.bold)
                                        .font(.title2)
                                        .foregroundStyle(optionColor.text)
                                    +
                                    Text("a")
                                        .fontWeight(.bold)
                                        .font(.title2)
                                        .foregroundStyle(optionColor.text)
                                Text("[      ]")
                                    .fontWeight(.bold)
                                    .font(.title2)
                                    .foregroundStyle(optionColor.bracket)
                                }
                                Spacer()
                            }
                            .padding()
                        }
                        .background(optionColor.background)
                        .clipShape(RoundedRectangle(cornerRadius: 15.0))
                        .overlay(RoundedRectangle(cornerRadius: 15.0)
                            .stroke(optionColor.border, lineWidth: 3))
                        .padding(EdgeInsets(top: 5, leading: 10, bottom: 0, trailing: 10))
                        .onTapGesture {
                            clickedOptionIndex = index
                        }
                        .onAppear {
                            if String(optionAlphabet[index]) == hangulUnit.hangulCards[hangulUnit.unitIndex].sound {
                                answerIndex = index
                            }
                            print("###Hi")
                        }
                        .onChange(of: isSubmitAnswer) { _ in
                            if String(optionAlphabet[index]) == hangulUnit.hangulCards[hangulUnit.unitIndex].sound {
                                answerIndex = index
                            }
                        }
                    }
                    Spacer()
                    Divider()
                        .padding(.vertical, 10)
                    HStack{
                        ZStack{
                            Image(systemName: "arrow.uturn.backward")
                                .foregroundStyle(.blue)
                                .font(.system(size: 32.0))
                                .padding(10)
                        }
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 15.0))
//                        .shadow(radius: 3)
                        .onTapGesture {
                            print()
                        }
                        Spacer()
                        
                        ZStack{
                            Image(systemName: "arrow.uturn.backward")
                                .foregroundStyle(.clear)
                                .font(.system(size: 32.0))
                                .padding(10)
                            HStack{
                                if !isSubmitAnswer {
                                    Text("Continue")
                                        .fontWeight(.bold)
                                        .font(.system(size: 20))
                                        .foregroundStyle(.white)
                                } else {
                                    Image(systemName: "arrow.right.circle.fill")
                                        .font(.system(size: 32.0))
                                        .foregroundStyle(.white)
                                    Text("Next")
                                        .fontWeight(.bold)
                                        .font(.system(size: 17))
                                        .foregroundStyle(.white)
                                }
                            }
                            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        }
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 12.0))
//                        .shadow(radius: 3)
                        .onTapGesture {
//                            if hangulUnit.unitIndex == hangulUnit.hangulCards.count{
//                                
//                            }
                            if isSubmitAnswer {
                                nextQuiz()
                                optionAlphabet = quizAlgorithm()
                            } else{
                                isSubmitAnswer = true
                            }
                        }
                    }
                    .padding(.bottom, 20)
                }
                .frame(width: UIScreen.main.bounds.size.width - 30)
            }
            .navigationTitle("Quiz")
            .navigationBarBackButtonHidden()
            .onAppear {
                optionAlphabet = quizAlgorithm()
                print("Hi")
            }
        }
    }
    func quizAlgorithm() -> [Character] {
        let alphabet: String = "abcdefghijklmnopqrstuvwxyz"
        let answerFilter: Character = Character(String(hangulUnit.hangulCards[hangulUnit.unitIndex].sound))
        let tempOptionAlphabet: String = String(alphabet.filter { $0 != answerFilter })
        let optionAlphabet = String(tempOptionAlphabet.shuffled().prefix(3)) + hangulUnit.hangulCards[hangulUnit.unitIndex].sound
        return optionAlphabet.shuffled()
    }
    
    func optionStatus(index: Int) -> Int {
        if index != clickedOptionIndex && !isSubmitAnswer {
            return 1
        } else if index == clickedOptionIndex && !isSubmitAnswer {
            return 2
        } else if index != answerIndex && isSubmitAnswer && index == clickedOptionIndex {
            return 3
        } else if index == answerIndex && isSubmitAnswer {
            return 4
        }
        return 1
    }
    
    func fetchOptionColor(status: Int) -> OptionColor {
        switch status {
        case 1 :
            return OptionColor(circle: .clear, text: .black, bracket: .gray, background: .white, border: .clear)
        case 2 :
            return OptionColor(circle: .blue, text: .blue, bracket: .blue, background: .white, border: .blue)
        case 3 :
            return OptionColor(circle: .red, text: .red, bracket: .red, background: .white, border: .red)
        case 4 :
            return OptionColor(circle: .white, text: .white, bracket: .white, background: .blue, border: .clear)
        default:
            return OptionColor(circle: .clear, text: .black, bracket: .gray, background: .white, border: .clear)
        }
        
    }
    
    func fetchQandaStatus() -> QandA {
        if !isSubmitAnswer {
            return QandA(text: "Q . 밑줄친부분의 올바른 발음은?", color: .blue)
        } else if isSubmitAnswer && clickedOptionIndex == answerIndex {
            return QandA(text: "축하!", color: .blue)
        } else if isSubmitAnswer && clickedOptionIndex != answerIndex {
            return QandA(text: "땡!", color: .red)
        }
        return QandA(text: "Q . 밑줄친부분의 올바른 발음은?", color: .blue)
    }
    
    func nextQuiz() {
        hangulUnit = HangulUnit(unitName: hangulUnit.unitName, unitIndex: hangulUnit.unitIndex + 1, hangulCards: hangulUnit.hangulCards)
        isOptionClicked = false
        clickedOptionIndex = 5
        answerIndex = 5
        isSubmitAnswer = false
        optionAlphabet = []
    }
}

struct OptionColor {
    let circle : Color
    let text : Color
    let bracket : Color
    let background : Color
    let border : Color
}

struct QandA {
    let text : String
    let color : Color
}


#Preview {
    ConsonantQuizView(hangulUnit: HangulUnit(unitName: "consonants1", unitIndex: 0, hangulCards: [
        HangulCard(name: "ㄱ", sound: "g", example1: "가", example2: "구", soundExample1: "ga", soundExample2: "gu", quiz: "가든", lottieName: "gun"),
        HangulCard(name: "ㄴ", sound: "n", example1: "나", example2: "누", soundExample1: "na", soundExample2: "nu", quiz: "나노", lottieName: "nose"),
        HangulCard(name: "ㄷ", sound: "d", example1: "다", example2: "두", soundExample1: "da", soundExample2: "du", quiz: "다트", lottieName: "drink"),
        HangulCard(name: "ㄹ", sound: "r", example1: "라", example2: "루", soundExample1: "ra", soundExample2: "ru", quiz: "라디오", lottieName: "road")
    ]))
}
