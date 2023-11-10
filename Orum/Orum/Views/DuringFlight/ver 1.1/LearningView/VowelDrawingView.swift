//
//  VowelDrawingView.swift
//  Orum
//
//  Created by 차차 on 11/8/23.
//

import SwiftUI

struct VowelDrawingView: View {
    @Binding var currentEducation: CurrentEducation
    
    @EnvironmentObject var educationManager: EducationManager

    var body: some View {
        Text("그려야 할 것: \(educationManager.content[educationManager.index].name)")
        
        Button(action: {
            currentEducation = .learning
        }, label: {
            Text("Continue")
        })
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    VowelDrawingView(currentEducation: .constant(.vowelDrawing))
        .environmentObject(EducationManager())
}
