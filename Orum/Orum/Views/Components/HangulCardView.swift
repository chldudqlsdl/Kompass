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
                
                VStack(spacing: cardType.imageMeaningSpacing){
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
                        
                    } else {
                        if hangulCard.chapterType == .consonant || hangulCard.chapterType == .batchim {
                            if hangulCard.hangulType == .single {
                                LottieView(fileName: hangulCard.lottieName)
                                    .frame(width: cardType.imageFrame, height: cardType.imageFrame)
                                //                                    .scaleEffect(x: -1, y: 1)
                                HStack {
                                    Spacer()
                                    
                                    Text("[")
                                        .fontWeight(.bold)
                                        .font(cardType.explanationFont(.consonant, hangulType: .single))
                                        .foregroundColor(Color(uiColor: .systemGray4))
                                    +
                                    Text(hangulCard.name == "ㅇb" ? hangulCard.lottieName.prefix(5) : hangulCard.lottieName.prefix(1))
                                        .fontWeight(.bold)
                                        .font(cardType.explanationFont(.consonant, hangulType: .single))
                                        .foregroundColor(hangulCard.name == "ㅇb" ? Color(uiColor: .systemGray4) : .primary)
                                    +
                                    Text(hangulCard.name == "ㅇb" ? hangulCard.lottieName.dropFirst(5) : hangulCard.lottieName.dropFirst(1))
                                        .fontWeight(.bold)
                                        .font(cardType.explanationFont(.consonant, hangulType: .single))
                                        .foregroundColor(hangulCard.name == "ㅇb" ? .primary : Color(uiColor: .systemGray4))
                                    +
                                    Text("]")
                                        .fontWeight(.bold)
                                        .font(cardType.explanationFont(.consonant, hangulType: .single))
                                        .foregroundColor(Color(uiColor: .systemGray4))
                                    
                                    Spacer()
                                }
                                //                                .scaleEffect(x: -1, y: 1)
                            } else {
                                HStack{
                                    Text("Pronounce '\(hangulCard.explanation)' with a strong empahsis.")
                                        .bold()
                                        .font(cardType.explanationFont(.consonant, hangulType: .double))
                                }
                                .frame(width: cardType.imageFrame)
                                //                                .scaleEffect(x: -1, y: 1)
                                .multilineTextAlignment(.center)
                            }
                        }
                        
                        else if hangulCard.chapterType == .vowel  {
                            HStack{
                                if hangulCard.hangulType == .single {
                                    TextWithColoredCharacters(text: hangulCard.explanation, targetCharacter: basicVowel, color: .blue)
                                        .bold()
                                        .font(cardType.explanationFont(.vowel, hangulType: .single))
//                                        .font(.largeTitle)
                                    
                                    
                                } else {
                                    Text("\(hangulCard.explanation)")
                                        .bold()
                                        .font(cardType.explanationFont(.consonant, hangulType: .double))
//                                        .font(.largeTitle)
                                }
                            }
                            .frame(width: cardType.imageFrame)
                            //                            .scaleEffect(x: -1, y: 1)
                            .multilineTextAlignment(.center)
                            
                        } else {
                            Rectangle()
                                .foregroundStyle(.clear)
                                .border(.black)
                                .frame(width: cardType.imageFrame , height: cardType.imageFrame)
                            //                                .scaleEffect(x: -1, y: 1)
                            
                            Text("[]")
                                .bold()
                                .font(cardType.explanationFont(.consonant, hangulType: .single))
                            //                                .scaleEffect(x: -1, y: 1)
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
        //        .rotation3DEffect(isFlipped ? Angle(degrees: 180) : .zero,
        //                          axis: (x: 0.0, y: 1.0, z: 0.0))
        //        .animation(.easeInOut(duration: 0.5), value: isFlipped)
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
                    //                    isFlipped.toggle()
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
    HangulCardView(onTapGesture: {},hangulCard: HangulUnitEnum.consonant4[0], cardType: .large, canBorderColorChange: true)
        .environmentObject(EducationManager())
}

