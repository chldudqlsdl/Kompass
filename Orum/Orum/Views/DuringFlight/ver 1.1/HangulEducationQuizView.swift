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
    @State var isNext: Bool = false
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
            ZStack {
                ScrollView {
                    VStack {
                        ProgressView(value: Double(progressValue) / Double(educationManager.content.count * 2 + 2))
                            .padding(.vertical, 16)
                        
                        HStack {
                            Text("Select appropriate pronunciation of underlined letter")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            
                            Spacer()
                        }
                        .padding(.bottom, 16)
                        
                        VStack {
                            HStack{
                                Spacer()
                                
                                ZStack(alignment: .leading) {
                                    Text(educationManager.quiz.isEmpty ? "" : educationManager.quiz[ind].quiz.prefix(1))
                                        .fontWeight(.bold)
                                        .font(.largeTitle)
                                        .padding(.bottom, 10)
                                        .foregroundColor(.clear)
                                        .underline(true, color: Color(uiColor: .label))
                                        .offset(y: 8)
                                    Text(educationManager.quiz.isEmpty ? "" : educationManager.quiz[ind].quiz)
                                        .fontWeight(.bold)
                                        .font(.largeTitle)
                                        .foregroundColor(Color(uiColor: .label))
                                }
                                
                                Spacer()
                            }
                            .padding(.vertical, 8)
                            .overlay {
                                RoundedRectangle(cornerRadius: 16)
                                    .strokeBorder(Color(uiColor: .systemFill) , lineWidth: 8)
                            }
                            .padding(.bottom, 12)
                            
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
                                        if String(optionAlphabet[index]) == educationManager.quiz[ind].sound {
                                            answerIndex = index
                                        }
                                        
                                    }
                                    .onAppear {
                                        if String(optionAlphabet[index]) == educationManager.quiz[ind].sound {
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

                        
                    }
                    .padding(.horizontal, 16)
                    .onAppear {
                        optionAlphabet = makeQuizs()
                    }
                    .onChange(of: isNext) {
                        selectedOptionIndex = 5
                        answerIndex = 5
                        isFinishButtonPressed = false
                        if !educationManager.quiz.isEmpty {
                            optionAlphabet = makeQuizs()
                        }
                    }
                    .onChange(of: isOptionSubmitted) { _ in
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            withAnimation(.easeOut(duration: 0.3)) {
                                proxy.scrollTo(bottomID)
                            }
                        }
                    }
                }
                .navigationTitle(educationManager.nowStudying)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading: Button(action: {
                    isPresented.toggle()
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title3)
                        .foregroundStyle(.blue, Color(uiColor: .secondarySystemFill))
                        .symbolRenderingMode(.palette)
                }))
                
                //버튼 뒷배경
                VStack {
                    Spacer()
                    
                    HStack {
                        Button(action: {}, label: {
                            Text("Continue")
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 8)
                                .bold()
                        })
                        .buttonStyle(.borderedProminent)
                        .hidden()
                    }
                    .padding(24)
                    .background(Color(uiColor: .systemBackground)).opacity(0.8)
                    .background(.ultraThinMaterial)
                }
                
                VStack {
                    Spacer()
                    
                    Button(action: {
                        if quizButtonText == "Check" {
                            isOptionSubmitted = true
                            quizButtonText = "Got it"
                            return
                        }
                        else {
                            isNext.toggle()
                            
                            if  ind < educationManager.quiz.endIndex - 1 {
                                if !isOptionWrong {
                                    progressValue += 1
                                    educationManager.quiz.remove(at: ind)
                                }
                                else {
                                    if educationManager.wrongCount[educationManager.quiz[ind].name] == nil {
                                        educationManager.wrongCount[educationManager.quiz[ind].name] = "1"
                                    }
                                    else {
                                        let count = Int(educationManager.wrongCount[educationManager.quiz[ind].name]!)
                                        educationManager.wrongCount.updateValue(String(count! + 1) , forKey: "\(educationManager.quiz[ind].name)")
                                    }
                                    ind += 1
                                }
                                
                                quizButtonText = "Check"
                                isOptionSelected = false
                                isOptionSubmitted = false
                                isOptionWrong = false
                            }
                            else {
                                if !isOptionWrong {
                                    educationManager.quiz.remove(at: ind)
                                }
                                else {
                                    if educationManager.wrongCount[educationManager.quiz[ind].name] == nil {
                                        educationManager.wrongCount[educationManager.quiz[ind].name] = "1"
                                    }
                                    else {
                                        let count = Int(educationManager.wrongCount[educationManager.quiz[ind].name]!)
                                        educationManager.wrongCount.updateValue(String(count! + 1) , forKey: "\(educationManager.quiz[ind].name)")
                                    }
                                }
                                
                                if educationManager.quiz.isEmpty {
                                    educationManager.endChapter()
                                    isPresented.toggle()
                                }
                                else {
                                    ind = 0
                                    quizButtonText = "Check"
                                    isOptionSelected = false
                                    isOptionSubmitted = false
                                    isOptionWrong = false
                                }
                                
                                withAnimation(.easeIn(duration: 1)) {
                                    progressValue += 1
                                }
                            }
                        }
                    },label: {
                        Text(quizButtonText)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                            .bold()
                    })
                    .buttonStyle(.borderedProminent)
                    .tint(!isOptionWrong ? .blue : .red)
                    .disabled(!isOptionSelected)
                    .padding(24)
                }
            }
        }
    }
    
    func makeQuizs() -> [Character] { // TODO: 알파벳이 두 개인 경우 (ㅊ, 쌍자음, 모음)
        let alphabet: String = "abcdefghijklmnopqrstuvwxyz"
        let answerFilter: Character = Character(String(educationManager.quiz.isEmpty ? " " : educationManager.quiz[ind].sound))
        let tempOptionAlphabet: String = String(alphabet.filter { $0 != answerFilter })
        if !educationManager.quiz.isEmpty {
            return (String(tempOptionAlphabet.shuffled().prefix(3)) +  educationManager.quiz[ind].sound).shuffled()
        }
        else {
            return [Character("")]
        }
        
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
