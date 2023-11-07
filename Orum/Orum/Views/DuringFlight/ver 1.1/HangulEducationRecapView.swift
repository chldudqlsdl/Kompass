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
    @State var isOnceFlipped : [Bool] = [false,false,false,false,false,false,false,false,false,false] // TODO: HangulCardView
    @State var isFlipped : [Bool] = [false,false,false,false,false,false,false,false,false,false]
    @Binding var ind: Int
    
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
                        ForEach(0 ..< content.hangulCards.count, id: \.self) { index in
                            HangulCardView(hangulCard: $content.hangulCards[index], isLearningView: $islearningView, touchCardsCount: $touchCardsCount, isOnceFlipped: $isOnceFlipped[index], isFlipped: $isFlipped[index], lottieView: LottieView(fileName: content.hangulCards[index].name))
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
    HangulEducationRecapView(content: .constant(HangulUnit(unitName: "consonants1", hangulCards: HangulCard.preview)), ind: .constant(0))
}
