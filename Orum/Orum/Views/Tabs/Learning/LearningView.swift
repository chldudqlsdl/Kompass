//
//  LearnView.swift
//  Orum
//
//  Created by 차차 on 10/31/23.
//

import SwiftUI


struct LearningView: View {
    @EnvironmentObject var educationManager: EducationManager
        
    @State private var isPresented = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                VStack(alignment: .leading,spacing: 16) {
                    ForEach (0 ..< 4) { ind in
                        Chapter(action: {
                            isPresented.toggle()
                        }, chapterIndex: ind)
                    .environmentObject(educationManager)
                    }
                }
                .padding(.leading, 15)
            }
            .navigationTitle("Learn")
            .fullScreenCover(isPresented: $isPresented, content: {
                HangulEducationView(isPresented: $isPresented)
                    .environmentObject(educationManager)
            })
        }
    }
}


#Preview {
        LearningView()
        .environmentObject(EducationManager())
}
