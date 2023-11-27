//
//  LearningLessonView.swift
//  Orum
//
//  Created by 차차 on 11/15/23.
//

import SwiftUI

enum CurrentEducation {
    case vowelDrawing
    case learning
    case basicVowelCheck
    case recap
    case vowelQuiz
    case quiz
    case batchim
    case complexBatchim
    case end
}

struct LearningLessonView: View {
    @Binding var isPresented: Bool
    @State var currentEducation: CurrentEducation = .learning
    @EnvironmentObject var educationManager: EducationManager
    
    @State var progressValue: Int = 0
    
    var body: some View {
        switch educationManager.currentEducation {
        case .vowelDrawing:
            VowelDrawingView(progressValue: $progressValue)
                .environmentObject(educationManager)
            
        case .learning:
            HangulEducationLearningView(progressValue: $progressValue)
                .environmentObject(educationManager)
                .transition(.opacity)
            
        case .basicVowelCheck:
            BasicVowelCheckView(progressValue: $progressValue)
                .environmentObject(educationManager)
                .transition(.opacity)
            
        case .recap:
            HangulEducationRecapView(progressValue: $progressValue)
                .environmentObject(educationManager)
            
        case .vowelQuiz:
            SameCardCollectingQuizView(progressValue: $progressValue)
                .environmentObject(educationManager)
                .padding(16)
            
        case .quiz:
            HangulEducationQuizView(progressValue: $progressValue, isPresented: $isPresented)
                .environmentObject(educationManager)
                .transition(.opacity)
            
        case .batchim:
            BatchimLearningView(progressValue: $progressValue, currentEducation: $currentEducation, isPresented: $isPresented)
                .environmentObject(educationManager)
            
        case .complexBatchim:
            ComplexBatchimLearningView(progressValue: $progressValue, isPresented: $isPresented)
                .environmentObject(educationManager)
            
        case .end:
            LessonEndingView(isPresented: $isPresented)
                .environmentObject(educationManager)
        }
        
    }
}

#Preview {
    LearningLessonView(isPresented: .constant(false))
        .environmentObject(EducationManager())
}
