//
//  ConsonantQuizView.swift
//  Orum
//
//  Created by Youngbin Choi on 10/23/23.
//

import SwiftUI

struct ConsonantQuizView: View {
    @EnvironmentObject var educationManager: EducationManager

    @State var hangulUnit : HangulUnit
    @State var isOptionClicked : Bool = false
    @State var clickedOptionIndex : Int = 5
    @State var answerIndex : Int = 5
    @State var isSubmitAnswer : Bool = false
    @State var isFinishButtonPressed: Bool = false
    @State var optionAlphabet : [Character] = []
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color(uiColor: .secondarySystemBackground).edgesIgnoringSafeArea(.all)
                VStack{
                    ZStack{
                        VStack{
                            HStack{
                                Spacer()
                                Text("\(hangulUnit.unitIndex + 1)/\(hangulUnit.hangulCards.count)")
                                    .fontWeight(.bold)
                                    .font(.body)
                                    .foregroundColor(Color(uiColor: .systemGray4))
                                    
                            }
                            ZStack(alignment: .leading){
                                Text(hangulUnit.hangulCards[hangulUnit.unitIndex].quiz.prefix(1))
                                    .fontWeight(.bold)
                                    .font(.system(size: 105))
                                    .padding(.bottom, 10)
                                    .foregroundColor(.clear)
                                    .underline(true, color: Color(uiColor: .label))
                                    .offset(y: 10)
                                Text(hangulUnit.hangulCards[hangulUnit.unitIndex].quiz)
                                    .fontWeight(.bold)
                                    .font(.system(size: 105))
                                    .foregroundColor(Color(uiColor: .label))
                                    .padding(.bottom, 10)
                            }
                            let qandaStatus = fetchQandaStatus()
                            Text(qandaStatus.text)
                                .fontWeight(.bold)
                                .font(.body)
                                .foregroundColor(qandaStatus.color)
                        }
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 20, trailing: 10))
                    }
                    .background(Color(uiColor: .systemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 15.0))
                    ForEach(0..<optionAlphabet.count, id: \.self) { index in
                        let optionColor = fetchOptionColor(index: index)
                        ZStack{
                            HStack(spacing: 20){
                                Circle()
                                    .strokeBorder(.blue, lineWidth: 3)
                                    .frame(width: 20, height: 20)
                                    .overlay {
                                        Circle()
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(optionColor.circle)
                                    }
                                ZStack{
                                    Text("\(String(optionAlphabet[index]))")
                                        .fontWeight(.bold)
                                        .font(.title2)
                                        .foregroundColor(optionColor.text)
                                    +
                                    Text("a")
                                        .fontWeight(.bold)
                                        .font(.title2)
                                        .foregroundColor(optionColor.text)
                                Text("[      ]")
                                    .fontWeight(.bold)
                                    .font(.title2)
                                    .foregroundColor(optionColor.bracket)
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
                            if !isSubmitAnswer {
                                clickedOptionIndex = index
                            }
                        }
                        .onAppear {
                            if String(optionAlphabet[index]) == hangulUnit.hangulCards[hangulUnit.unitIndex].sound {
                                answerIndex = index
                            }
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
                                .foregroundColor(.blue)
                                .font(.system(size: 32.0))
                                .padding(10)
                        }
                        .background(Color(uiColor: .systemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 15.0))
                        .onTapGesture {
                            print()
                        }
                        Spacer()
                        
                        ZStack{
                            // 버튼 크기 맞추기 위한 코드
                            Image(systemName: "arrow.uturn.backward")
                                .foregroundColor(.clear)
                                .font(.system(size: 32.0))
                                .padding(10)
                            HStack{
                                if !isSubmitAnswer {
                                    Text(String(localized: "Continue"))
                                        .fontWeight(.bold)
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                } else {
                                    Image(systemName: "arrow.right.circle.fill")
                                        .font(.system(size: 32.0))
                                        .foregroundColor(.white)
                                    Text(String(localized: "Next"))
                                        .fontWeight(.bold)
                                        .font(.system(size: 17))
                                        .foregroundColor(.white)
                                }
                            }
                            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        }
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 12.0))
                        .onTapGesture {
                            if hangulUnit.unitIndex == hangulUnit.hangulCards.count - 1{
                                isFinishButtonPressed.toggle()
//                                educationManager.unit = .Consonants2
                                isSubmitAnswer = false
                            }
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
            .navigationTitle(String(localized: "Quiz"))
            .navigationBarTitleDisplayMode(.large)
            .navigationBarBackButtonHidden()
            .navigationDestination(isPresented: $isFinishButtonPressed, destination: {
                FlightMainView()
                    .navigationBarBackButtonHidden()
                    .environmentObject(educationManager)
            })
            .onAppear {
                if hangulUnit.unitIndex != hangulUnit.hangulCards.count {
                    optionAlphabet = quizAlgorithm()
                }
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
    
    func fetchOptionColor(index: Int) -> OptionColor {
        if index != clickedOptionIndex && !isSubmitAnswer {
            return OptionColor(circle: .clear, text: Color(uiColor: .label), bracket: Color(uiColor: .label).opacity(0.4), background: Color(uiColor: .systemBackground), border: .clear)
        } else if index == clickedOptionIndex && !isSubmitAnswer {
            return OptionColor(circle: .blue, text: .blue, bracket: .blue.opacity(0.4), background: Color(uiColor: .systemBackground), border: .blue)
        } else if index != answerIndex && isSubmitAnswer && index == clickedOptionIndex {
            return OptionColor(circle: .red, text: .red, bracket: .red.opacity(0.4), background: Color(uiColor: .systemBackground), border: .red)
        } else if index == answerIndex && isSubmitAnswer {
            return OptionColor(circle: .white, text: .white, bracket: .white.opacity(0.4), background: .blue, border: .clear)
        }
        return OptionColor(circle: .clear, text: Color(uiColor: .label), bracket: Color(uiColor: .label).opacity(0.4), background: Color(uiColor: .systemBackground), border: .clear)
    }
    
    func fetchQandaStatus() -> QandA {
        if !isSubmitAnswer {
            return QandA(text: "Q . \(String(localized: "What is the correct pronunciation of the underlined part?"))", color: .blue)
        } else if isSubmitAnswer && clickedOptionIndex == answerIndex {
            return QandA(text: String(localized: "Congratulation!"), color: .blue)
        } else if isSubmitAnswer && clickedOptionIndex != answerIndex {
            return QandA(text: String(localized: "Oops"), color: .red)
        }
        return QandA(text: "Q . \(String(localized: "What is the correct pronunciation of the underlined part?"))", color: .blue)
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

//struct OptionColor {
//    let circle : Color
//    let text : Color
//    let bracket : Color
//    let background : Color
//    let border : Color
//}

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
    .environmentObject(EducationManager())
}
