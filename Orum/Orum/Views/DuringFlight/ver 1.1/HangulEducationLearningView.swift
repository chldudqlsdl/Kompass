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
            
            HangulCardView(content: $content, isOnceFlipped: $isOnceFlipped, isFlipped: $isFlipped, lottieView: LottieView(fileName: content.hangulCards[content.unitIndex].name))
        }
    }
}

#Preview {
    HangulEducationLearningView(content: .constant(HangulUnit(unitName: "consonants1", unitIndex: 0, hangulCards: HangulCard.preview)), isOnceFlipped: .constant(false), isFlipped: .constant(false))
}
