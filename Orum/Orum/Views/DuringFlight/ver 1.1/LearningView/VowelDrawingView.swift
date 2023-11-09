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
        VStack {
            
            Button(action: {
                currentEducation = .learning
            }, label: {
                Text("Continue")
            })
            .buttonStyle(.borderedProminent)
        }
        
    }
}

#Preview {
    VowelDrawingView(currentEducation: .constant(.vowelDrawing))
}
