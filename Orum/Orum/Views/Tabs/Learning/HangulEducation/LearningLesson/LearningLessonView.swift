//
//  LearningLessonView.swift
//  Orum
//
//  Created by 차차 on 11/15/23.
//

import SwiftUI

enum CurrentEducation {
    case instruction
    case vowelDrawing
    case learning
    case basicVowelCheck
    case recap
    case vowelQuiz
    case quiz
}

struct LearningLessonView: View {
    @Binding var isPresented: Bool
    
    @EnvironmentObject var educationManager: EducationManager
    
    @State var currentEducation: CurrentEducation = .instruction
    @State var progressValue: Int = 0
    
    var body: some View {
        switch currentEducation {
        case .instruction:
            HangulEducationInstructionView(currentEducation: $currentEducation, progressValue: $progressValue, isPresented: $isPresented)
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
    }
}

#Preview {
    LearningLessonView(isPresented: .constant(false))
        .environmentObject(EducationManager())
}
