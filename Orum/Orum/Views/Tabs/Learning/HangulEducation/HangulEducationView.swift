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
        
        var body: some View {
            VStack {
                switch educationManager.lessonType {
                case .prologue:
                    PrologueLessonView(isPresented: $isPresented)
                    
                case .lesson:
                    LearningLessonView(isPresented: $isPresented)
                            .environmentObject(educationManager)
                    
                case .epilogue:
                    EpilogueLessonView(isPresented: $isPresented)
                           .environmentObject(educationManager)
                }
            }        
            .navigationTitle(educationManager.lessonType == .prologue ? "" : educationManager.nowStudying)
        }
    }


#Preview {
    HangulEducationView(isPresented: .constant(false))
        .environmentObject(EducationManager())
}
