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
            switch currentEducation {
            case .onboarding:
                HangulEducationOnboardingView(currentEducation: $currentEducation, progressValue: $progressValue, isPresented: $isPresented)
                    .environmentObject(educationManager)
                
            case .vowelDrawing:
                VowelDrawingView(currentEducation: $currentEducation)
                    .environmentObject(educationManager)
                    .padding(16)
                
            case .learning:
                HangulEducationLearningView(progressValue: $progressValue, currentEducation: $currentEducation, isPresented: $isPresented)
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
        }
        .edgesIgnoringSafeArea([.bottom])
    }
}

enum CurrentEducation {
    case onboarding
    case vowelDrawing
    case learning
    case recap
    case vowelQuiz
    case quiz
}

#Preview {
    HangulEducationView(isPresented: .constant(true))
        .environmentObject(EducationManager())
}
