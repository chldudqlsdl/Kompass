//
//  HangulEducationLearningView.swift
//  Orum
//
//  Created by Youngbin Choi on 10/31/23.
//

import SwiftUI

struct HangulEducationLearningView: View {
    @Binding var content : HangulUnit
    @Binding var isOnceFlipped : Bool
    @Binding var isFlipped: Bool
    
    var body: some View {
        VStack(spacing: 98){
            HStack{
                Text("Focus on form and pronunciation")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
            }
            
            HangulCardView(content: $content, isOnceFlipped: $isOnceFlipped, isFlipped: $isFlipped)
        }
    }
}

#Preview {
    HangulEducationLearningView(content: .constant(HangulUnit(unitName: "consonants1", unitIndex: 0, hangulCards: [
        HangulCard(name: "ㄱ", sound: "g", example1: "가", example2: "구", soundExample1: "ga", soundExample2: "gu", quiz: "가든", lottieName: "gun"),
        HangulCard(name: "ㄴ", sound: "n", example1: "나", example2: "누", soundExample1: "na", soundExample2: "nu", quiz: "나노", lottieName: "nose"),
        HangulCard(name: "ㄷ", sound: "d", example1: "다", example2: "두", soundExample1: "da", soundExample2: "du", quiz: "다트", lottieName: "drink"),
        HangulCard(name: "ㄹ", sound: "r", example1: "라", example2: "루", soundExample1: "ra", soundExample2: "ru", quiz: "라디오", lottieName: "road")
    ])), isOnceFlipped: .constant(false), isFlipped: .constant(false))
}
