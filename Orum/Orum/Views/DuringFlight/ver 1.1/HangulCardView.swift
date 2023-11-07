//
//  HangulCardView.swift
//  Orum
//
//  Created by Youngbin Choi on 10/31/23.
//

import SwiftUI

struct HangulCardView: View {
    @Binding var hangulCard: HangulCard
    @Binding var isLearningView : Bool
    @Binding var touchCardsCount : Int
    @Binding var isOnceFlipped : Bool
    @Binding var isFlipped: Bool
    @State var lottieView : LottieView
    
    var body: some View {
        ZStack{
            HStack{
                Spacer()
                VStack(spacing: 16){
                    if !isFlipped {
                        Image(hangulCard.name)
                            .resizable()
                            .frame(width: isLearningView ? 180 : 130 , height: isLearningView ? 180 : 130)
                        ZStack{
                            Text(hangulCard.sound)
                                .fontWeight(.bold)
                                .font( isLearningView ? .largeTitle : .title2)
                            Text("[   ]")
                                .fontWeight(.bold)
                                .font( isLearningView ? .largeTitle : .title2)
                                .foregroundColor(Color(uiColor: .systemGray4))
                        }
                    } else {
                        LottieView(fileName: hangulCard.name)
                            .frame(width: isLearningView ? 180 : 130 , height: isLearningView ? 180 : 130)
                            .scaleEffect(x: -1, y: 1)
                        HStack{
                            Spacer()
                            
                            Text("[")
                                .fontWeight(.bold)
                                .font( isLearningView ? .largeTitle : .title2)
                                .foregroundColor(Color(uiColor: .systemGray4))
                            +
                            Text(hangulCard.lottieName)
                                .fontWeight(.bold)
                                .font( isLearningView ? .largeTitle : .title2)
                            +
                            Text("]")
                                .fontWeight(.bold)
                                .font( isLearningView ? .largeTitle : .title2)
                                .foregroundColor(Color(uiColor: .systemGray4))
                            
                            Spacer()
                        }
                        .scaleEffect(x: -1, y: 1)
                    }
                }
                .padding(EdgeInsets(top: isLearningView ? 50 : 20 , leading: 0, bottom: isLearningView ? 40 : 20, trailing: 0))
                Spacer()
            }
        }
        .overlay(RoundedRectangle(cornerRadius: 24)
            .stroke(isOnceFlipped ? Color(uiColor: .systemGray4) : .blue , lineWidth: 11))
        .rotation3DEffect(isFlipped ? Angle(degrees: 180) : .zero,
                          axis: (x: 0.0, y: 1.0, z: 0.0))
        .animation(.easeInOut(duration: 0.5), value: isFlipped)
        .onTapGesture {
            if !isOnceFlipped {
                touchCardsCount += 1
            }
            isFlipped.toggle()
            isOnceFlipped = true
        }
    }
}

#Preview {
    HangulCardView(hangulCard: .constant(HangulUnitEnum.consonant1.hangulCards[1]), isLearningView: .constant(true), touchCardsCount: .constant(0), isOnceFlipped: .constant(false), isFlipped: .constant(false), lottieView: LottieView(fileName: "ㄱ"))
}
