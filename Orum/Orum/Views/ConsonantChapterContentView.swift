//
//  ConsonantChapterContentView.swift
//  Orum
//
//  Created by Youngbin Choi on 10/22/23.
//

import SwiftUI

struct ConsonantChapterContentView: View {
    
    @State var hangulCard : HangulCard
    @State var flipCheck : Bool = false
    @State var checkCount : Int = 0
    @State var flipped: Bool = false
    
    var body: some View {
        ZStack{
            VStack(spacing: 10){
                Image(hangulCard.name)
                    .resizable()
                    .padding(EdgeInsets(top: 30, leading: 30, bottom: 0, trailing: 30))
                    .scaledToFit()
                ZStack{
                    Text(hangulCard.sound)
                        .fontWeight(.bold)
                        .font(.largeTitle)
                    Text("[   ]")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .foregroundStyle(Color(UIColor(hex: "D1D1D6")))
                }
//                .padding(15)
                Divider()
                Image(systemName: "lightbulb.circle.fill")
                    .font(.system(size: 32.0))
                    .foregroundStyle(.blue)
                    .padding(5)
                    .onTapGesture {
                        if !flipCheck {
                            checkCount += 1
                        }
                        flipped.toggle()
                        flipCheck = true
                    }
                    .overlay {
                        Circle()
                            .frame(width: 4)
                            .offset(y: 20)
                            .foregroundStyle( flipCheck ? .blue : .clear )
                    }
            }
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 15.0))
//            .shadow(radius: 3)
        .rotation3DEffect(flipped ? Angle(degrees: 180) : .zero,
                          axis: (x: 0.0, y: 1.0, z: 0.0))
        .animation(.default, value: flipped)
    }
}

#Preview {
    ConsonantChapterContentView(hangulCard: HangulCard(name: "ㄱ", sound: "g", example1: "가", example2: "구", soundExample1: "ga", soundExample2: "gu", quiz: "가든"))
}
