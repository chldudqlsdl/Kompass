//
//  HangulEducationQuizView.swift
//  Orum
//
//  Created by Youngbin Choi on 10/31/23.
//

import SwiftUI

struct HangulQuizView: View {
    
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
    @State var optionAlphabet : [String] = []
    @Namespace var topID
    @Namespace var bottomID
    
    @State var ind: Int = 0
    
    var body: some View {
        ScrollViewReader { proxy in
            ZStack {
                ScrollView {
                    VStack(spacing: 16) {
                        ProgressView(value: Double(progressValue) / Double(educationManager.content.count * 2 + 2))
                            .padding(.vertical, 16)
                            .id(topID)
                        
                        VStack {
                            Text("Quiz")
                                .font(.body)
                                .fontWeight(.bold)
                                .foregroundStyle(.secondary)
                            
                            Text("Select the correct pronunciation")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                        }
                        .padding(.bottom, 9)
                        
                        
                        VStack {
                            if !educationManager.quiz.isEmpty {
                                Image(educationManager.quiz[ind].name + "\(educationManager.lessonType == .epilogue ? 1 : 0)")
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height * 0.2)
                        .background(Color(uiColor: .quaternarySystemFill))
                        
                        LazyVGrid(columns: [GridItem(.flexible(),spacing: 16),GridItem(.flexible(),spacing: 16)], spacing: 16, content: {
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
                                        
                                        Image(systemName: "speaker.wave.2.fill")
                                            .bold()
                                            .font(.title2)
                                            .foregroundColor(optionColor.text)
                                        
                                        Spacer()
                                    }
                                    .padding()
                                }
                                .overlay(RoundedRectangle(cornerRadius: 15.0)
                                    .stroke(optionColor.border, lineWidth: 4))
                                .onTapGesture {
                                    SoundManager.instance.playSound(sound: optionAlphabet[index])
                                    if !isOptionSubmitted {
                                        selectedOptionIndex = index
                                        isOptionSelected = true
                                    }
                                    if String(optionAlphabet[index]) == educationManager.quiz[ind].quizName {
                                        answerIndex = index
                                    }
                                }
                                .onAppear {
                                    if String(optionAlphabet[index]) == educationManager.quiz[ind].quizName  {
                                        answerIndex = index
                                    }
                                }
                                .onChange(of: isOptionSubmitted) { _ in
                                    if answerIndex != selectedOptionIndex && isOptionSubmitted {
                                        isOptionWrong = true
                                    }
                                    
                                }
                            }
                        })
                        
                        Spacer()
                        
                        Rectangle()
                            .frame(height: 200)
                            .foregroundColor(.clear)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.clear)
                            .id(bottomID)
                        
                        
                        
                    }
                    .padding(.horizontal, 16)
                    .onAppear {
                        optionAlphabet = makeQuiz()
                        print(optionAlphabet)
                    }
                    .onChange(of: isNext) {
                        selectedOptionIndex = 5
                        answerIndex = 5
                        isFinishButtonPressed = false
                        if !educationManager.quiz.isEmpty {
                            optionAlphabet = makeQuiz()
                        }
                    }
                    .onChange(of: isOptionSubmitted) { _ in
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            withAnimation(.easeOut(duration: 0.3)) {
                                proxy.scrollTo(bottomID)
                            }
                        }
                    }
                    .onChange(of: isOptionSelected) { _ in
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            withAnimation(.easeOut(duration: 0.3)) {
                                proxy.scrollTo(topID)
                            }
                        }
                    }
                }
                
                ZStack {
                    
                    VStack {
                        Spacer()
                        
                        Rectangle()
                            .foregroundStyle(.ultraThinMaterial)
                            .frame(height: UIScreen.main.bounds.height * 0.15)
                    }
                    .ignoresSafeArea(edges: .bottom)
                    
                    if (isOptionSubmitted) {
                        answerBox()
                            .transition(.move(edge: .bottom))
                    }
                    
                    VStack {
                        Spacer()
                        
                        VStack(spacing: 0) {
                            Button(action: {
                                if quizButtonText == "Check" {
                                    DispatchQueue.global().async {
                                        quizButtonText = "Got it"
                                        
                                    }
                                    DispatchQueue.global().async {
                                        withAnimation {
                                            isOptionSubmitted = true
                                        }
                                    }
                                    
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
                                        
                                        withAnimation {
                                            quizButtonText = "Check"
                                            isOptionSelected = false
                                            isOptionSubmitted = false
                                            isOptionWrong = false
                                        }
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
                                            educationManager.currentEducation = .end
                                            //                                            educationManager.endLesson()
                                            //                                            isPresented.toggle()
                                        }
                                        else {
                                            ind = 0

                                            withAnimation {
                                                quizButtonText = "Check"
                                                isOptionSelected = false
                                                isOptionSubmitted = false
                                                isOptionWrong = false
                                            }
                                        }
                                        
                                        withAnimation(.easeIn(duration: 1)) {
                                            progressValue += 1
                                        }
                                    }
                                }
                            },label: {
                                Text(quizButtonText)
                                    .transition(.identity)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 8)
                                    .bold()
                            })
                            .buttonStyle(.borderedProminent)
                            .tint(!isOptionWrong ? .blue : .red)
                            .disabled(!isOptionSelected)
                            .padding(.horizontal, 24)
                            .padding(.top, 24)
                            .padding(.bottom, 48)
                        }
                    }
                    .ignoresSafeArea(edges: .bottom)
                }
            }
        }
    }
    
    @ViewBuilder
    private func answerBox() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Spacer()
            
            VStack(alignment: .leading , spacing: 16) {
                Rectangle()
                    .frame(height: 5)
                    .foregroundColor(isOptionWrong ? .red : .blue)
                
                VStack(alignment: .leading,spacing: 16) {
                    HStack{
                        Image(systemName: isOptionWrong ? "exclamationmark.circle.fill" : "checkmark.circle.fill")
                            .font(.title2)
                            .foregroundColor(isOptionWrong ? .red : .blue)
                        
                        Text(isOptionWrong ? "Incorrect" : "Correct")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(isOptionWrong ? .red : .blue)
                        
                        Spacer()
                    }
                    if !educationManager.quiz.isEmpty{
                        Text(isOptionWrong ? (educationManager.quiz.isEmpty ? "" : "\(educationManager.quiz[ind].name ) has a [\(educationManager.quiz[ind].sound)] sound." ) : (educationManager.quiz.isEmpty ? "" :"\(educationManager.quiz[ind].quizName) means “\(educationManager.quiz[ind].meaning)” in Korean."))
                            .fontWeight(.bold)
                            .foregroundColor(isOptionWrong ? .red : .blue)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 16)
                
                Spacer()
                    .frame(height: UIScreen.main.bounds.height * 0.1)
            }
            .frame(maxWidth: .infinity)
            .background(!isOptionWrong ? Color(UIColor(hex: "F2F8FF")) : Color(UIColor(hex: "FFF5F5")))
        }
        .ignoresSafeArea(edges: .bottom)
    }
    
    func makeQuiz() -> [String] {
        var optionArray = educationManager.quiz[ind].options
        optionArray.append(educationManager.quiz[ind].quizName)
        return optionArray.shuffled()
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
    
    // 정답을 체크할때 나오는 배경이 투명도가 있어서 뒷부분이 콘텐츠가 비쳐보이는 문제가 발생해, 뒤에 시스템배경을 깔아줌
    func correctionBackgroundBackground() -> Color {
        if isOptionSubmitted && !isOptionWrong {
            Color(uiColor: .systemBackground)
        }
        else if isOptionSubmitted && isOptionWrong {
            Color(uiColor: .systemBackground)
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
    HangulQuizView(progressValue: .constant(0), isPresented: .constant(false))
        .environmentObject(EducationManager())
}
