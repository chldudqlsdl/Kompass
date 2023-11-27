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
                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))

        case .learning:
            HangulEducationLearningView(progressValue: $progressValue)
                .environmentObject(educationManager)
                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))

        case .basicVowelCheck:
            BasicVowelCheckView(progressValue: $progressValue)
                .environmentObject(educationManager)
                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
        case .recap:
            HangulEducationRecapView(progressValue: $progressValue)
                .environmentObject(educationManager)
                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))

        case .vowelQuiz:
            SameCardCollectingQuizView(progressValue: $progressValue)
                .environmentObject(educationManager)
                .padding(16)
                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))

        case .quiz:
            HangulEducationQuizView(progressValue: $progressValue, isPresented: $isPresented)
                .environmentObject(educationManager)
                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
            
        case .batchim:
            BatchimLearningView(progressValue: $progressValue, currentEducation: $currentEducation, isPresented: $isPresented)
                .environmentObject(educationManager)
                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))

        case .complexBatchim:
            ComplexBatchimLearningView(progressValue: $progressValue, isPresented: $isPresented)
                .environmentObject(educationManager)
                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))

        case .end:
            LessonEndingView(isPresented: $isPresented)
                .environmentObject(educationManager)
                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))

        }
        
    }
}

#Preview {
    LearningLessonView(isPresented: .constant(false))
        .environmentObject(EducationManager())
}
