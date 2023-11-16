//
//  OnboardingView.swift
//  Orum
//
//  Created by 차차 on 11/15/23.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var isFirstLaunching: Bool
    
    var body: some View {
        VStack(spacing: 45) {
            Rectangle()
                .padding(.horizontal, 16)
                .padding(.top, 80)
            
            Text("Title")
                .bold()
                .font(.title)
            
            Text("내용")
            
            Button(action: {
                isFirstLaunching.toggle()
            }, label: {
                Text("Let's Orum!")
            })
            .buttonStyle(.borderedProminent)
            
        }
    }
}

#Preview {
    OnboardingView(isFirstLaunching: .constant(false))
}
