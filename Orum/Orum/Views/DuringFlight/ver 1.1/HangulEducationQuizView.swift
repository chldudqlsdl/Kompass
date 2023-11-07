//
//  HangulEducationQuizView.swift
//  Orum
//
//  Created by Youngbin Choi on 10/31/23.
//

import SwiftUI

struct HangulEducationQuizView: View {
    
    @Binding var content : HangulUnit
    @Binding var isOptionSelected : Bool
    @Binding var isOptionSubmitted : Bool
    @Binding var isOptionWrong : Bool
    
    @State var selectedOptionIndex : Int = 5
    @State var answerIndex : Int = 5
    @State var isFinishButtonPressed: Bool = false
    @State var optionAlphabet : [Character] = []
    @Namespace var bottomID
    
    var body: some View {
        ScrollViewReader{ proxy in
            ScrollView{
                VStack(spacing: 74){
                    HStack {
                        Text("Select appropriate pronunciation of underlined letter")
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    VStack(spacing: 16) {
                        HStack{
                            Spacer()
                            ZStack(alignment: .leading){
                                Text(content.hangulCards[content.unitIndex].quiz.prefix(1))
                                    .fontWeight(.bold)
                                    .font(.largeTitle)
                                    .padding(.bottom, 10)
                                    .foregroundColor(.clear)
                                    .underline(true, color: Color(uiColor: .label))
                                    .offset(y: 8)
                                Text(content.hangulCards[content.unitIndex].quiz)
                                    .fontWeight(.bold)
                                    .font(.largeTitle)
                                    .foregroundColor(Color(uiColor: .label))
                            }
                            Spacer()
                        }
                        .padding(.vertical, 20)
                        .overlay(RoundedRectangle(cornerRadius: 24)
                            .stroke(Color(uiColor: .systemGray4) , lineWidth: 8))
                        VStack{
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
                                                .foregroundColor(optionColor.bracket)
                                            Text("[      ]")
                                                .fontWeight(.bold)
                                                .font(.title2)
                                                .foregroundColor(optionColor.bracket)
                                        }
                                        Spacer()
                                    }
                                    .padding()
                                }
                                .overlay(RoundedRectangle(cornerRadius: 15.0)
                                    .stroke(optionColor.border, lineWidth: 4))
                                .onTapGesture {
                                    if !isOptionSubmitted {
                                        selectedOptionIndex = index
                                        isOptionSelected = true
                                    }
                                    if String(optionAlphabet[index]) == content.hangulCards[content.unitIndex].sound {
                                        answerIndex = index
                                    }
                                    
                                }
                                .onAppear {
                                    if String(optionAlphabet[index]) == content.hangulCards[content.unitIndex].sound {
                                        answerIndex = index
                                    }
                                }
                                .onChange(of: isOptionSubmitted) { _ in
                                    if answerIndex != selectedOptionIndex && isOptionSubmitted {
                                        isOptionWrong = true
                                    }
                                    
                                }
                            }
                        }
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.clear)
                            .id(bottomID)
                    }
                    .padding(.horizontal, 20)
                    
                }
                .onAppear{
                    optionAlphabet = makeQuizs()
                }
                .onChange(of: content.unitIndex) {
                    selectedOptionIndex = 5
                    answerIndex = 5
                    isFinishButtonPressed = false
                    optionAlphabet = makeQuizs()
                }
                .onChange(of: isOptionSubmitted) { _ in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        withAnimation(.easeOut(duration: 0.3)) {
                            proxy.scrollTo(bottomID)
                        }
                    }
                }
            }
        }
    }
    
    func makeQuizs() -> [Character] {
        let alphabet: String = "abcdefghijklmnopqrstuvwxyz"
        let answerFilter: Character = Character(String(content.hangulCards[content.unitIndex].sound))
        let tempOptionAlphabet: String = String(alphabet.filter { $0 != answerFilter })
        let optionAlphabet = String(tempOptionAlphabet.shuffled().prefix(3)) + content.hangulCards[content.unitIndex].sound
        return optionAlphabet.shuffled()
    }
    
    func fetchOptionColor(index: Int) -> OptionColor {
        if index != selectedOptionIndex && !isOptionSubmitted {
            return OptionColor(circle: .clear, text: Color(uiColor: .label), bracket: Color(uiColor: .label).opacity(0.4), background: Color(uiColor: .systemBackground), border: .clear)
        }
        else if index == selectedOptionIndex && !isOptionSubmitted {
            return OptionColor(circle: .blue, text: .blue, bracket: .blue.opacity(0.4), background: Color(uiColor: .systemBackground), border: .blue)
        }
        else if index != answerIndex && isOptionSubmitted && index == selectedOptionIndex {
            return OptionColor(circle: .red, text: .red, bracket: .red.opacity(0.4), background: Color(uiColor: .systemBackground), border: .red)
        }
        else if index == selectedOptionIndex && isOptionSubmitted {
            return OptionColor(circle: .blue, text: .blue, bracket: .blue.opacity(0.4), background: Color(uiColor: .systemBackground), border: .blue)
        }
        return OptionColor(circle: .clear, text: Color(uiColor: .label), bracket: Color(uiColor: .label).opacity(0.4), background: Color(uiColor: .systemBackground), border: .clear)
    }
    
}

struct OptionColor {
    let circle : Color
    let text : Color
    let bracket : Color
    let background : Color
    let border : Color
}

#Preview {
    HangulEducationQuizView(content: .constant(HangulUnit(unitName: "consonants1", unitIndex: 0, hangulCards: HangulCard.preview)), isOptionSelected: .constant(false), isOptionSubmitted: .constant(false), isOptionWrong: .constant(false))
}
