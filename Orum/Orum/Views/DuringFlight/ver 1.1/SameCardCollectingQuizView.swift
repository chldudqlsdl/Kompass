//
//  SameCardCollectingQuizView.swift
//  Orum
//
//  Created by 차차 on 11/8/23.
//

import SwiftUI

struct SameCardCollectingQuizView: View {
    @Binding var currentEducation: CurrentEducation
    @Binding var progressValue: Int
    
    @EnvironmentObject var educationManager: EducationManager
    
    var body: some View {
        Text("Same Card Collecting Quiz")
        
        Button(action: {
            currentEducation = .quiz
            progressValue += 1
        }, label: {
            Text("Continue")
        })
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    SameCardCollectingQuizView(currentEducation: .constant(.vowelQuiz), progressValue: .constant(0))
        .environmentObject(EducationManager())
}
