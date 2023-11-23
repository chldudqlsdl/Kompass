//
//  HangulEducationView.swift
//  Orum
//
//  Created by 차차 on 10/31/23.
//

import SwiftUI


    struct HangulEducationView: View {
        @Binding var isPresented: Bool
//        @State var isPresented = false
//        
//        var lesson: Lesson?
        @EnvironmentObject var educationManager: EducationManager
        
        var body: some View {
            //        NavigationView {
            VStack {
                switch educationManager.lessonType {
                case .prologue:
                    PrologueLessonView(isPresented: $isPresented)
                    //                        .environmentObject(educationManager)
                    
                case .lesson:
                    LearningLessonView(isPresented: $isPresented)
                            .environmentObject(educationManager)
                    
                case .epilogue:
                    EpilogueLessonView(isPresented: $isPresented)
                           .environmentObject(educationManager)
                }
            }        
            .navigationTitle(educationManager.nowStudying)
            .navigationBarTitleDisplayMode(.inline)
        }
    }


#Preview {
    HangulEducationView(isPresented: .constant(false))
        .environmentObject(EducationManager())
}
