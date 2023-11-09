//
//  HangulEducationQuizView.swift
//  Orum
//
//  Created by Youngbin Choi on 10/31/23.
//

import SwiftUI

struct HangulEducationQuizView: View {
    
    @Binding var progressValue: Int
    @Binding var isPresented: Bool
    
    @State var isSameCardEnded: Bool = false
    @State var isOptionSelected : Bool = false
    @State var isOptionSubmitted : Bool = false
    @State var isOptionWrong : Bool = false
    @State var quizButtonText: String = "Check"
    
    @EnvironmentObject var educationManager: EducationManager
    
    @State var selectedOptionIndex : Int = 5
    @State var answerIndex : Int = 5
    @State var isFinishButtonPressed: Bool = false
    @State var optionAlphabet : [Character] = []
    @Namespace var bottomID
    
    @State var ind: Int = 0
    
    var body: some View {
            ScrollViewReader { proxy in
                ScrollView {
                    VStack(spacing: 74) {
                        HStack {
                            Text("Select appropriate pronunciation of underlined letter")
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                        
                        VStack(spacing: 16) {
                            HStack{
                                Spacer()
                                ZStack(alignment: .leading) {
                                    Text(educationManager.content[ind].quiz.prefix(1))
                                        .fontWeight(.bold)
                                        .font(.largeTitle)
                                        .padding(.bottom, 10)
                                        .foregroundColor(.clear)
                                        .underline(true, color: Color(uiColor: .label))
                                        .offset(y: 8)
                                    Text(educationManager.content[ind].quiz)
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
                                        if String(optionAlphabet[index]) == educationManager.content[ind].sound {
                                            answerIndex = index
                                        }
                                        
                                    }
                                    .onAppear {
                                        if String(optionAlphabet[index]) == educationManager.content[ind].sound {
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
                        
                        Button(action: {
                            if quizButtonText == "Check" {
                                isOptionSubmitted = true
                                quizButtonText = "Got it"
                                return
                            }
                            if  ind < educationManager.content.count - 1 {
                                if isOptionWrong {
                                    educationManager.wrongQuestion.append(educationManager.content[ind]) //MARK: 틀린 문제 로직 구현
                                } else {
                                    progressValue += 1
                                }
                                ind += 1
                                quizButtonText = "Check"
                                isOptionSelected = false
                                isOptionSubmitted = false
                                isOptionWrong = false
                            }
                            else {
                                educationManager.endChapter()
                                
                                withAnimation(.easeIn(duration: 1)) {
                                    progressValue += 1
                                }
                                
                                isPresented.toggle()
                            }
                        },label: {
                            HStack{
                                Spacer()
                                Text(quizButtonText)
                                Spacer()
                            }
                            .padding(.vertical, 5)
                        })
                        .buttonStyle(.borderedProminent)
                        .tint(!isOptionWrong ? .blue : .red)
                        .disabled(!isOptionSelected)
                        .padding(EdgeInsets(top: 16, leading: 16, bottom: 50, trailing: 16))
                        
                        
                    }
                    .onAppear{
                        optionAlphabet = makeQuizs()
                    }
                    .onChange(of: ind) {
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
    
    func makeQuizs() -> [Character] { // TODO: 알파벳이 두 개인 경우 (ㅊ, 쌍자음, 모음)
        let alphabet: String = "abcdefghijklmnopqrstuvwxyz"
        let answerFilter: Character = Character(String(educationManager.content[ind].sound))
        let tempOptionAlphabet: String = String(alphabet.filter { $0 != answerFilter })
        let optionAlphabet = String(tempOptionAlphabet.shuffled().prefix(3)) + educationManager.content[ind].sound
        
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
    
    func correctionBackground() -> Color {
        if isOptionSubmitted && !isOptionWrong {
            Color.blue.opacity(0.05)
        }
        else if isOptionSubmitted && isOptionWrong {
            Color.red.opacity(0.05)
        } else {
            Color.clear
        }
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
    HangulEducationQuizView(progressValue: .constant(0), isPresented: .constant(false))
        .environmentObject(EducationManager())
}
