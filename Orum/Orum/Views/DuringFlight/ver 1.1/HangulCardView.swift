//
//  HangulCardView.swift
//  Orum
//
//  Created by Youngbin Choi on 10/31/23.
//

import SwiftUI

struct HangulCardView: View {
    
    @Binding var content : HangulUnit
    @Binding var flipCheck : Bool
    @Binding var flipped: Bool
    
    var body: some View {
        ZStack{
            VStack(spacing: 16){
                if !flipped {
                    Image(content.hangulCards[content.unitIndex].name)
                        .resizable()
                        .frame(width: 180, height: 180)
                    ZStack{
                        Text(content.hangulCards[content.unitIndex].sound)
                            .fontWeight(.bold)
                            .font(.largeTitle)
                        Text("[   ]")
                            .fontWeight(.bold)
                            .font(.largeTitle)
                            .foregroundStyle(Color(UIColor(hex: "D1D1D6")))
                    }
                } else {
                    LottieView(fileName: content.hangulCards[content.unitIndex].name)
                        .frame(width: 180, height: 180)
                        .scaleEffect(x: -1, y: 1)
                    ZStack{
                        Text("[")
                            .fontWeight(.bold)
                            .font(.largeTitle)
                            .foregroundStyle(Color(UIColor(hex: "D1D1D6")))
                        +
                        Text(content.hangulCards[content.unitIndex].lottieName)
                            .fontWeight(.bold)
                            .font(.largeTitle)
                        +
                        Text("]")
                            .fontWeight(.bold)
                            .font(.largeTitle)
                            .foregroundStyle(Color(UIColor(hex: "D1D1D6")))
                    }
                    .scaleEffect(x: -1, y: 1)
                }
//                Divider()
//                Image(systemName: "lightbulb.circle.fill")
//                    .font(.system(size: 32.0))
//                    .foregroundStyle(.blue)
//                    .padding(10)
//                    .onTapGesture {
//                        if !flipCheck {
//                            checkCount += 1
//                        }
//                        flipped.toggle()
//                        flipCheck = true
//                    }
//                    .overlay {
//                        Circle()
//                            .frame(width: 4)
//                            .offset(y: 20)
//                            .foregroundStyle( flipCheck ? .blue : .clear )
//                    }
            }
            .padding(EdgeInsets(top: 50, leading: 30, bottom: 40, trailing: 30))
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10.0))
        .overlay(RoundedRectangle(cornerRadius: 10)
            .stroke(flipCheck ? Color(uiColor: .systemGray4) : .blue , lineWidth: 11))
        .rotation3DEffect(flipped ? Angle(degrees: 180) : .zero,
                          axis: (x: 0.0, y: 1.0, z: 0.0))
        .animation(.default, value: flipped)
        .onTapGesture {
//            if !flipCheck {
//                checkCount += 1
//            }
            flipped.toggle()
            flipCheck = true
        }
    }
}

#Preview {
    HangulCardView(content: .constant(HangulUnit(unitName: "consonants1", unitIndex: 0, hangulCards: [
        HangulCard(name: "ㄱ", sound: "g", example1: "가", example2: "구", soundExample1: "ga", soundExample2: "gu", quiz: "가든", lottieName: "gun"),
        HangulCard(name: "ㄴ", sound: "n", example1: "나", example2: "누", soundExample1: "na", soundExample2: "nu", quiz: "나노", lottieName: "nose"),
        HangulCard(name: "ㄷ", sound: "d", example1: "다", example2: "두", soundExample1: "da", soundExample2: "du", quiz: "다트", lottieName: "drink"),
        HangulCard(name: "ㄹ", sound: "r", example1: "라", example2: "루", soundExample1: "ra", soundExample2: "ru", quiz: "라디오", lottieName: "road")
    ])), flipCheck: .constant(false), flipped: .constant(false))
}
