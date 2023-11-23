//
//  HangulEducationQuizView.swift
//  Orum
//
//  Created by Youngbin Choi on 11/16/23.
//

import SwiftUI

struct HangulEducationQuizView: View {
    @Binding var progressValue: Int
    @Binding var isPresented: Bool
    
    @EnvironmentObject var educationManager: EducationManager
    
    var body: some View {
        HangulQuizView(progressValue: $progressValue, isPresented: $isPresented)
            .environmentObject(educationManager)
    }
}

#Preview {
    HangulEducationQuizView(progressValue: .constant(0), isPresented: .constant(false))
        .environmentObject(EducationManager())
}
