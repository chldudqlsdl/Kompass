//
//  ConsonantLearningView.swift
//  Orum
//
//  Created by 차차 on 11/8/23.
//

import SwiftUI

struct ConsonantLearningView: View {
    @EnvironmentObject var educationManager: EducationManager

    @State var currentEducation: CurrentEducation = .onboarding
    @State var progressValue : Int = 0
    @State var touchCardsCount : Int = 0
    @State var isOnceFlipped : Bool = false
    @State var isExample1Listened : Bool = false
    @State var isExample2Listened : Bool = false
    @State var isFlipped: Bool = false
    @State var index: Int = 0
    
    @Binding var isOptionSelected : Bool
    @Binding var isOptionSubmitted : Bool
    @Binding var isOptionWrong : Bool
    @Binding var quizButtonText: String
    @Binding var isPresented: Bool
    
    var body: some View {
        switch currentEducation {
        case .onboarding:
            HangulEducationOnboardingView(currentEducation: .constant(.learning), progressValue: .constant(0), isPresented: $isPresented)
                .environmentObject(educationManager)
                .padding(16)
            
            Spacer()
            
            VStack {
                Button(action: {
                    currentEducation = .learning
                    progressValue += 1
                }){
                    HStack{
                        Spacer()
                        Text("Continue")
                        Spacer()
                    }
                    .padding(.vertical, 5)
                }
                .buttonStyle(.borderedProminent)
            }
            .padding(EdgeInsets(top: 16, leading: 16, bottom: 50, trailing: 16))
            
        case .learning:
            HangulEducationLearningView(progressValue: $progressValue, currentEducation: $currentEducation)
                .environmentObject(educationManager)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                .transition(.opacity)
            
            Spacer()
            
            ZStack{
                VStack(spacing: 0){
                    if (index == 0 && isOnceFlipped && isExample1Listened && isExample2Listened){
                        VStack{
                            Rectangle()
                                .frame(height: 5)
                                .foregroundColor(.blue)
                            VStack(alignment: .leading, spacing: 16){
                                HStack{
                                    Image(systemName: "info.circle.fill")
                                        .font(.title2)
                                        .foregroundColor(.blue)
                                    Text("info")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.blue)
                                }
                                Text("\(educationManager.content[index].name) has a similar shape and [\(educationManager.content[index].sound)] sound of \(educationManager.content[index].lottieName).")
                                    .fontWeight(.bold)
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                    VStack{
                        Button(action: {
                            if  index < educationManager.content.count - 1 {
                                index += 1
                                progressValue += 1
                            } else {
                                isOnceFlipped = false
                                index = 0
                                
                                withAnimation(.easeIn(duration: 1)) {
                                    progressValue += 1
                                    currentEducation = .recap
                                }
                            }
                            
                            withAnimation (.easeIn(duration: 1)){
                                isOnceFlipped = false
                                isFlipped = false
                                isExample1Listened = false
                                isExample2Listened = false
                                touchCardsCount = 0
                            }
                        }){
                            HStack{
                                Spacer()
                                Text("Continue")
                                Spacer()
                            }
                            .padding(.vertical, 5)
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(!isOnceFlipped || !isExample1Listened || !isExample2Listened)
                    }
                    .padding(EdgeInsets(top: 16, leading: 16, bottom: 50, trailing: 16))
                }
            }
            .background((index == 0 && isOnceFlipped && isExample1Listened && isExample2Listened) ? .blue.opacity(0.05) : .clear)
        case .vowelQuiz:
            Spacer()
        case .vowelDrawing:
            Spacer()
            
        case .recap:
            ZStack{
                HangulEducationRecapView(progressValue: $progressValue, currentEducation: $currentEducation)
                    .environmentObject(educationManager)
                    .padding(.horizontal, 16)
                    
                VStack{
                    Spacer()
                    Button {
                        progressValue += 1
                        index = 0
                        currentEducation = .quiz
                    } label: {
                        HStack{
                            Spacer()
                            Text("Ready to Quiz")
                            Spacer()
                        }
                        .padding(.vertical, 5)
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(EdgeInsets(top: 16, leading: 16, bottom: 50, trailing: 16))
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color(uiColor: .systemBackground).opacity(0.0), Color(uiColor: .systemBackground).opacity(1.0)]), startPoint: .top, endPoint: .bottom)
                    )
                }
            }
            
            EmptyView()
                .padding(EdgeInsets(top: 16, leading: 16, bottom: 50, trailing: 16))
            
        case .quiz:
            HangulEducationQuizView(progressValue: $progressValue, isPresented: $isPresented)
                .environmentObject(educationManager)
                .padding(16)
                .transition(.opacity)
            
            Spacer()
            
            ZStack{
                VStack(spacing: 0){
                    if (isOptionSubmitted){
                        VStack{
                            Rectangle()
                                .frame(height: 5)
                                .foregroundColor(isOptionWrong ? .red : .blue)
                            VStack(alignment: .leading, spacing: 16){
                                HStack{
                                    Image(systemName: isOptionWrong ? "exclamationmark.circle.fill" : "checkmark.circle.fill")
                                        .font(.title2)
                                        .foregroundColor(isOptionWrong ? .red : .blue)
                                    Text(isOptionWrong ? "Incorrect" : "Correct")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(isOptionWrong ? .red : .blue)
                                }
                                Text( isOptionWrong ? "\(educationManager.content[index].name ) has a similar shape and [\(educationManager.content[index].sound)] sound of \(educationManager.content[index].lottieName)." : "감사합니다[gamsahabnida] means “Thank you” in Korean.")
                                    .fontWeight(.bold)
                                    .foregroundColor(isOptionWrong ? .red : .blue)
                            }
                        }
                    }
                    VStack{
                        Button(action: {
                            if quizButtonText == "Check" {
                                isOptionSubmitted = true
                                quizButtonText = "Got it"
                                return
                            }
                            if  index < educationManager.content.count - 1 {
                                if isOptionWrong {
                                } else {
                                    progressValue += 1
                                }
                                index += 1
                                quizButtonText = "Check"
                                isOptionSelected = false
                                isOptionSubmitted = false
                                isOptionWrong = false
                            }
                            else {
                                educationManager.endChapter()

                                withAnimation(.easeIn(duration: 1)) {
//                                                currentEducation = .recap
                                    progressValue += 1
                                }
                                
                                isPresented.toggle()
                            }
                        }){
                            HStack{
                                Spacer()
                                Text(quizButtonText)
                                Spacer()
                            }
                            .padding(.vertical, 5)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(!isOptionWrong ? .blue : .red)
                        .disabled(!isOptionSelected)
                    }
                    .padding(EdgeInsets(top: 16, leading: 16, bottom: 50, trailing: 16))
                }
            }
            .background(
                correctionBackground()
            )
        }
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

#Preview {
    ConsonantLearningView(isOptionSelected: .constant(false), isOptionSubmitted: .constant(false), isOptionWrong: .constant(false), quizButtonText: .constant("Check"), isPresented: .constant(false))
}
