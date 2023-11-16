//
//  EpilogueQuizVIew.swift
//  Orum
//
//  Created by Youngbin Choi on 11/16/23.
//

import SwiftUI

struct EpilogueQuizVIew: View {
    
    @Binding var progressValue: Int
    @Binding var isPresented: Bool
    
    @EnvironmentObject var educationManager: EducationManager
    
    var body: some View {
        HangulQuizView(progressValue: $progressValue, isPresented: $isPresented)
            .environmentObject(educationManager)
    }
}

#Preview {
    EpilogueQuizVIew(progressValue: .constant(0), isPresented: .constant(false))
        .environmentObject(EducationManager())
}
