//
//  EpilogueLessonView.swift
//  Orum
//
//  Created by 차차 on 11/14/23.
//

import SwiftUI

enum CurrentEpliogue {
    case quiz
    case end
}

struct EpilogueLessonView: View {
    @Binding var isPresented: Bool
    
    @EnvironmentObject var educationManager: EducationManager
    
//    @State var currentEpliogue: CurrentEpliogue = .quiz
    @State var progressValue: Int = 0
    
    var body: some View {
//        switch currentEpliogue {
        switch educationManager.currentEducation {
        case .quiz:
            EpilogueQuizVIew(progressValue: $progressValue, isPresented: $isPresented)
                .environmentObject(educationManager)
                .transition(.opacity)
            
        case .end:
            LessonEndingView(isPresented: $isPresented)
                .environmentObject(educationManager)
        default:
            EmptyView()
        }
    }
}

#Preview {
    EpilogueLessonView(isPresented: .constant(false))
        .environmentObject(EducationManager())
}
