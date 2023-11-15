//
//  ConsonantOnboarding.swift
//  Orum
//
//  Created by 차차 on 11/8/23.
//

import SwiftUI

struct ConsonantOnboarding: View {
    var body: some View {
        VStack {
            VStack {} //상단 패딩 위해 사용, 패딩은 항상 stack의 아래에 bottom으로
                .padding(.bottom, 32)
            
            VStack {
                Image(systemName: "info.bubble")
                    .foregroundStyle(.blue)
                    .font(.largeTitle)
                    .scaleEffect(2)
                    .padding()
                
                Text("Before Learning")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
            }
            .padding(.bottom, 32)
            
            HStack {
                Image(systemName: "rectangle.fill.on.rectangle.fill")
                    .font(.title)
                    .foregroundColor(.blue)
                    .padding(.trailing, 8)
                
                VStack(alignment: .leading){
                    Text("For the accurate pronunciation, Listen to the sound through a small card with Hangul written on it.")
                        .fontWeight(.medium)
                    Text("Pronunciation through the alphabet is not completely accurate.")
                        .foregroundColor(Color(uiColor: .secondaryLabel))
                }
                
                Spacer()
            }
            .padding(.bottom, 16)
            
            HStack {
                Image(systemName: "speaker.wave.2.fill")
                    .font(.title)
                    .foregroundColor(.blue)
                    .padding(.trailing, 8)
                
                VStack(alignment: .leading) {
                    Text("The basic vowels ㅏ[a] and ㅜ[u] will be used to make sound of consonant.")
                        .fontWeight(.medium)
                    Text("Hangul does not make sounds with consonants alone.")
                        .foregroundColor(Color(uiColor: .secondaryLabel))
                }
                
                Spacer()
            }
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    ConsonantOnboarding()
}
