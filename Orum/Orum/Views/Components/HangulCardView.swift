//
//  HangulCardView.swift
//  Orum
//
//  Created by Youngbin Choi on 10/31/23.
//

import SwiftUI

struct HangulCardView: View {
    @EnvironmentObject var educationManager: EducationManager
    var onTapGesture: () -> Void
    var hangulCard: HangulCard
    @State var isFlipped: Bool = false
    @State var isOnceFlipped: Bool = false
    @State var flashCardRotation = 0.0
    @State var contentRotation = 0.0
    
    var cardType: CardType
    var canBorderColorChange: Bool
    
    var basicVowel: Character {
        if hangulCard.name == "ㅡ" || hangulCard.name == "ㅗ" || hangulCard.name == "ㅜ" {
            return "o"
        }
        else if hangulCard.name == "ㅏ" || hangulCard.name == "ㅐ" || hangulCard.name == "ㅔ" {
            return "a"
        }
        else if hangulCard.name == "ㅣ" {
            return "e"
        }
        else {
            return "u"
        }
    }
    
    var body: some View {
        ZStack{
            HStack{
                Spacer()
                
                VStack(spacing: cardType.imageMeaningSpacing) {
                    if !isFlipped {
                        
                        Image(hangulCard.name)
                            .resizable()
                            .frame(width: cardType.imageFrame, height: cardType.imageFrame)
                        
                        Text("[ ")
                            .bold()
                            .font(cardType.font)
                            .foregroundColor(Color(uiColor: .systemGray4))
                        +
                        Text(hangulCard.sound)
                            .fontWeight(.bold)
                            .font(cardType.font)
                        +
                        Text(" ]")
                            .fontWeight(.bold)
                            .font( cardType.font )
                            .foregroundColor(Color(uiColor: .systemGray4))
                        
                    }
                    else {
                        switch hangulCard.chapterType {
                        case .system:
                            EmptyView()
                            
                        case .consonant:
                            if hangulCard.hangulType == .single {
                                LottieView(fileName: hangulCard.lottieName)
                                    .frame(width: cardType.imageFrame, height: cardType.imageFrame)
                                HStack {
                                    Spacer()
                                    
                                    Text("[")
                                        .fontWeight(.bold)
                                        .font(cardType.explanationFont(.consonant, hangulType: .single))
                                        .foregroundColor(Color(uiColor: .systemGray4))
                                    +
                                    Text(hangulCard.lottieName.prefix(1))
                                        .fontWeight(.bold)
                                        .font(cardType.explanationFont(.consonant, hangulType: .single))
                                    +
                                    Text(hangulCard.lottieName.dropFirst(1))
                                        .fontWeight(.bold)
                                        .font(cardType.explanationFont(.consonant, hangulType: .single))
                                        .foregroundColor(Color(uiColor: .systemGray4))
                                    +
                                    Text("]")
                                        .fontWeight(.bold)
                                        .font(cardType.explanationFont(.consonant, hangulType: .single))
                                        .foregroundColor(Color(uiColor: .systemGray4))
                                    
                                    Spacer()
                                }
                            } 
                            else {
                                HStack {
                                    Text("Pronounce '\(hangulCard.explanation)' with a strong empahsis.")
                                        .bold()
                                        .font(cardType.explanationFont(.consonant, hangulType: .double))
                                }
                                .frame(width: cardType.imageFrame)
                                .multilineTextAlignment(.center)
                            }
                            
                        case .vowel:
                                HStack {
                                    if hangulCard.hangulType == .single {
                                        TextWithColoredCharacters(text: hangulCard.explanation, targetCharacter: basicVowel, color: .blue)
                                            .bold()
                                            .font(cardType.explanationFont(.vowel, hangulType: .single))
                                    } 
                                    else {
                                        Text("\(hangulCard.explanation)")
                                            .bold()
                                            .font(cardType.explanationFont(.vowel, hangulType: .double))
                                    }
                                }
                                .frame(width: cardType.imageFrame)
                                .multilineTextAlignment(.center)
                            
                        case .batchim:
                                switch hangulCard.batchimType {
                                case .basic:
                                    ZStack{
                                        Text(hangulCard.name.prefix(1))
                                            .bold()
                                            .font(cardType.explanationFont(.batchim))
                                        +
                                        Text(" does not change in the final position")
                                            .bold()
                                            .font(cardType.explanationFont(.batchim))
                                    }
                                    .padding(.horizontal, 10)

                                case .eung:
                                    ZStack{
                                        Text(hangulCard.name.prefix(1))
                                            .bold()
                                            .font(cardType.explanationFont(.batchim))
                                        +
                                        Text(" changes to [ng] in the final position")
                                            .bold()
                                            .font(cardType.explanationFont(.batchim))
                                    }
                                    .padding(.horizontal, 10)
                                
                                case .change:
                                    ZStack{
                                        Text(hangulCard.name.prefix(1))
                                            .bold()
                                            .font(cardType.explanationFont(.batchim))
                                        +
                                        Text(" changes to [\(Constants.Hangul.batchimEndingRule[hangulCard.name]!)] in the final position")
                                            .bold()
                                            .font(cardType.explanationFont(.batchim))
                                    }
                                    .padding(.horizontal, 10)

                                case nil:
                                    EmptyView()
                                }
                        }
                    }
                }
                .frame(minHeight : cardType.maxHeight, maxHeight: cardType.maxHeight)
                .padding(EdgeInsets(top: cardType.paddingTop , leading: 0, bottom: cardType.paddingBottom, trailing: 0))
                Spacer()
            }
        }
        .overlay(RoundedRectangle(cornerRadius: cardType.cornerRadius)
            .strokeBorder(isOnceFlipped ? Color(uiColor: .systemGray4) : .blue , lineWidth: cardType.borderWidth))
        .rotation3DEffect(.degrees(contentRotation), axis: (0, 1, 0))
        .rotation3DEffect(.degrees(flashCardRotation), axis: (0, 1, 0))
        .contentShape(Rectangle())
        .gesture(
            TapGesture()
                .onEnded {
                    if !isOnceFlipped && canBorderColorChange {
                        isOnceFlipped = true
                    }
                    self.onTapGesture()
                    let animationTime = 0.5
                    withAnimation(Animation.easeInOut(duration: animationTime)){
                        if isFlipped {
                            flashCardRotation -= 180
                        } else {
                            flashCardRotation += 180
                        }
                    }
                    withAnimation(Animation.easeInOut(duration: 0.001).delay(animationTime / 2)){
                        if isFlipped {
                            contentRotation -= 180
                            isFlipped.toggle()
                        } else {
                            contentRotation += 180
                            isFlipped.toggle()
                        }
                    }
                }
        )
        .onChange(of: hangulCard){
            let animationTime = 1.0
            if isFlipped {
                withAnimation(Animation.easeInOut(duration: animationTime)){
                    flashCardRotation -= 180
                }
                withAnimation(Animation.easeInOut(duration: 0.001).delay(animationTime / 2)){
                    contentRotation -= 180
                }
                
                withAnimation (.easeIn(duration: 0.5).delay(0.5)){
                    isOnceFlipped = false
                    isFlipped = false
                }
            }
            else {
                withAnimation (.easeIn(duration: 1)){
                    isOnceFlipped = false
                    isFlipped = false
                }
            }
        }
    }
}


struct TextWithColoredCharacters: View {
    let text: String
    let targetCharacter: Character
    let color: Color
    
    var body: some View {
        let coloredText = text.map { char -> Text in
            if char == targetCharacter {
                return Text(String(char)).foregroundColor(color)
            } else {
                return Text(String(char))
            }
        }
        
        return HStack {
            coloredText.reduce(Text("")) { $0 + $1 }
        }
    }
}

#Preview {
        HangulCardView(onTapGesture: {},hangulCard: HangulUnitEnum.consonant1[0], cardType: .large, canBorderColorChange: true)
            .environmentObject(EducationManager())
}

