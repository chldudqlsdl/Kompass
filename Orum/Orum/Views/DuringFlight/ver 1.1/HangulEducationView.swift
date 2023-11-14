//
//  HangulEducationView.swift
//  Orum
//
//  Created by 차차 on 10/31/23.
//

import SwiftUI

struct HangulEducationView: View {
    
    @Binding var isPresented: Bool
    
    @EnvironmentObject var educationManager: EducationManager
    
    @State var currentEducation: CurrentEducation = .onboarding
    @State var progressValue : Int = 0
    @State var touchCardsCount : Int = 0
    
    var body: some View {
        NavigationView {
            switch educationManager.lessonType {
            case .prologue:
                PrologueView(isPresented: $isPresented)
                    .environmentObject(educationManager)
                
            case .lesson:
                switch currentEducation {
                case .onboarding:
                    HangulEducationOnboardingView(currentEducation: $currentEducation, progressValue: $progressValue, isPresented: $isPresented)
                        .environmentObject(educationManager)
                    
                case .vowelDrawing:
                    VowelDrawingView(currentEducation: $currentEducation, progressValue: $progressValue, isPresented: $isPresented)
                        .environmentObject(educationManager)
                    
                case .learning:
                    HangulEducationLearningView(progressValue: $progressValue, currentEducation: $currentEducation, isPresented: $isPresented)
                        .environmentObject(educationManager)
                        .transition(.opacity)
                
                case .basicVowelCheck:
                    BasicVowelCheckView(progressValue: $progressValue, isPresented: $isPresented, currentEducation: $currentEducation)
                        .environmentObject(educationManager)
                        .transition(.opacity)
                    
                case .recap:
                    HangulEducationRecapView(progressValue: $progressValue, currentEducation: $currentEducation, isPresented: $isPresented)
                        .environmentObject(educationManager)
                    
                case .vowelQuiz:
                    SameCardCollectingQuizView(currentEducation: $currentEducation, progressValue: $progressValue)
                        .environmentObject(educationManager)
                        .padding(16)
                
                case .quiz:
                    HangulEducationQuizView(progressValue: $progressValue, isPresented: $isPresented)
                        .environmentObject(educationManager)
                        .transition(.opacity)
                }
            case .quiz:
                QuizLessonView(isPresented: $isPresented)
                    .environmentObject(educationManager)
            }
        }
        .edgesIgnoringSafeArea([.bottom])
    }
}

enum CurrentEducation {
    case onboarding
    case vowelDrawing
    case learning
    case basicVowelCheck
    case recap
    case vowelQuiz
    case quiz
}

#Preview {
    HangulEducationView(isPresented: .constant(true))
        .environmentObject(EducationManager())
}
