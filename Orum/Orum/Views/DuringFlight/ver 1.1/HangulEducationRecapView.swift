//
//  HangulEducationRecapView.swift
//  Orum
//
//  Created by Youngbin Choi on 10/31/23.
//

import SwiftUI

struct HangulEducationRecapView: View {
    
    @State var islearningView = false
    @Binding var content : HangulUnit
    @State var touchCardsCount : Int = 0
    @State var isOnceFlipped : Bool = false
    @State var isFlipped : Bool = false
    
    
    var body: some View {
        ScrollView{
            VStack(spacing: 32){
                HStack{
                    Text("Recap what you learned to prepare Quiz session")
                        .font(.title2)
                        .bold()
                    Spacer()
                }
                .padding(.top, 16)
                VStack{
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 25), GridItem(.flexible())], spacing: 25) {
                        ForEach(0..<content.hangulCards.count, id: \.self) { index in
                            let hangulCard = content.hangulCards[index]
                            HangulCardView(content: $content, isLearningView: $islearningView, touchCardsCount: $touchCardsCount, isOnceFlipped: $isOnceFlipped, isFlipped: $isFlipped, lottieView: LottieView(fileName: content.hangulCards[content.unitIndex].name))
                        }
                    }
                }
                .padding(.horizontal, 7)
                .padding(.bottom, 85)
            }
        }
    }
}

#Preview {
    HangulEducationRecapView(content: .constant(HangulUnit(unitName: "consonants1", unitIndex: 0, hangulCards: HangulCard.preview)))
}
