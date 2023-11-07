//
//  HangulEducationOnboardingView.swift
//  Orum
//
//  Created by Youngbin Choi on 11/6/23.
//

import SwiftUI

struct HangulEducationOnboardingView: View {
    var body: some View {
        VStack(spacing: 71) {
            HStack{
                Text("Before Learing Consonant")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
            }
            VStack(spacing: 32 ){
                VStack{
                    Image(systemName: "rectangle.fill.on.rectangle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                        .padding(.bottom, 8)
                    Text("For the accurate pronunciation, Listen to the sound through a small card with Hangul written on it.")
                        .font(.body)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    Text("Pronunciation through the alphabet is not completely accurate.")
                        .font(.body)
                        .foregroundColor(Color(uiColor: .secondaryLabel))
                        .multilineTextAlignment(.center)
                }
                VStack{
                    Image(systemName: "speaker.wave.2.fill")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                        .padding(.bottom, 8)
                    Text("The basic vowels ㅏ[a] and ㅜ[u] will be used to make sound of consonant.")
                        .font(.body)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    Text("Hangul does not make sounds with consonants alone.")
                        .font(.body)
                        .foregroundColor(Color(uiColor: .secondaryLabel))
                        .multilineTextAlignment(.center)
                }
            }
            .padding(.horizontal, 31)
        }
    }
}

#Preview {
    HangulEducationOnboardingView()
}
