//
//  HangulCardView.swift
//  Orum
//
//  Created by Youngbin Choi on 10/31/23.
//

import SwiftUI

struct HangulCardView: View {
    
    @Binding var content : HangulUnit
    @Binding var isOnceFlipped : Bool
    @Binding var isFlipped: Bool
    @State var lottieView : LottieView
    
    @Binding var index: Int
    
    var body: some View {
        ZStack{
            VStack(spacing: 16){
                if !isFlipped {
                    Image(content.hangulCards[index].name)
                        .resizable()
                        .frame(width: 180, height: 180)
                    ZStack{
                        Text(content.hangulCards[index].sound)
                            .fontWeight(.bold)
                            .font(.largeTitle)
                        Text("[   ]")
                            .fontWeight(.bold)
                            .font(.largeTitle)
                            .foregroundColor(Color(uiColor: .systemGray4))
                    }
                } else {
                    LottieView(fileName: content.hangulCards[index].name)
                        .frame(width: 180, height: 180)
                        .scaleEffect(x: -1, y: 1)
                    ZStack{
                        Text("[")
                            .fontWeight(.bold)
                            .font(.largeTitle)
                            .foregroundColor(Color(uiColor: .systemGray4))
                        +
                        Text(content.hangulCards[index].lottieName)
                            .fontWeight(.bold)
                            .font(.largeTitle)
                        +
                        Text("]")
                            .fontWeight(.bold)
                            .font(.largeTitle)
                            .foregroundColor(Color(uiColor: .systemGray4))
                    }
                    .scaleEffect(x: -1, y: 1)
                }
            }
            .padding(EdgeInsets(top: 50, leading: 30, bottom: 40, trailing: 30))
        }
        .overlay(RoundedRectangle(cornerRadius: 24)
            .stroke(isOnceFlipped ? Color(uiColor: .systemGray4) : .blue , lineWidth: 11))
        .rotation3DEffect(isFlipped ? Angle(degrees: 180) : .zero,
                          axis: (x: 0.0, y: 1.0, z: 0.0))
        .animation(.easeInOut(duration: 0.5), value: isFlipped)
        .onTapGesture {
            isFlipped.toggle()
            isOnceFlipped = true
        }
    }
}

#Preview {
    HangulCardView(content: .constant(HangulUnit(unitName: "consonants1", hangulCards: HangulCard.preview)), isOnceFlipped: .constant(false), isFlipped: .constant(false), lottieView: LottieView(fileName: "ㄱ"), index: .constant(1))
}
