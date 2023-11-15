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
        NavigationView {
            switch educationManager.lessonType {
            case .prologue:
                PrologueLessonView(isPresented: $isPresented)
                    .environmentObject(educationManager)
            case .lesson:
                LearningLessonView(isPresented: $isPresented)
                    .environmentObject(educationManager)
            case .epilogue:
                EpilogueLessonView(isPresented: $isPresented)
                    .environmentObject(educationManager)
            }
        }
        .edgesIgnoringSafeArea([.bottom])
    }
}

#Preview {
    HangulEducationView(isPresented: .constant(true))
        .environmentObject(EducationManager())
}
