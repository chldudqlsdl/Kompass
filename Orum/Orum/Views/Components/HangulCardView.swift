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
    
    var cardType: CardType
    
    var body: some View {
        ZStack{
            HStack{
                
                Spacer()
                
                VStack(spacing: cardType.imageMeaningSpacing){
                    if !isFlipped {
                        Image(hangulCard.name)
                            .resizable()
                            .frame(width: cardType.imageFrame, height: cardType.imageFrame)
//                            .border(.red)
                        
                        Text("[ ")
                            .bold()
                            .font( cardType.font)
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
                        if hangulCard.chapterType == .consonant {
                            if hangulCard.hangulType == .single {
                                LottieView(fileName: hangulCard.name)
                                    .frame(width: cardType.imageFrame, height: cardType.imageFrame)
                                    .scaleEffect(x: -1, y: 1)
                                HStack {
                                    Spacer()
                                    
                                    Text("[")
                                        .fontWeight(.bold)
                                        .font(cardType.explanationFont(.consonant))
                                        .foregroundColor(Color(uiColor: .systemGray4))
                                    +
                                    Text(hangulCard.lottieName.prefix(1))
                                        .fontWeight(.bold)
                                        .font(cardType.explanationFont(.consonant))
                                    +
                                    Text(hangulCard.lottieName.dropFirst(1))
                                        .fontWeight(.bold)
                                        .font(cardType.explanationFont(.consonant))
                                        .foregroundColor(Color(uiColor: .systemGray4))
                                    +
                                    Text("]")
                                        .fontWeight(.bold)
                                        .font(cardType.explanationFont(.consonant))
                                        .foregroundColor(Color(uiColor: .systemGray4))
                                    
                                    Spacer()
                                }
                                .scaleEffect(x: -1, y: 1)
                            } else {
                                Rectangle()
                                    .foregroundStyle(.clear)
    //                                .border(.black)
                                    .frame(maxWidth: cardType.imageFrame, maxHeight: cardType.imageFrame )
                                    .scaleEffect(x: -1, y: 1)
                                HStack{
                                    Text(hangulCard.explanation)
                                        .bold()
                                        .font( cardType.explanationFont(.vowel))
                                }
                                .frame(width: cardType.imageFrame)
                                .scaleEffect(x: -1, y: 1)
                                .multilineTextAlignment(.center)
                            }
                        }
                        
                        else if hangulCard.chapterType == .vowel  {
                            Rectangle()
                                .foregroundStyle(.clear)
//                                .border(.black)
                                .frame(maxWidth: cardType.imageFrame, maxHeight: cardType.imageFrame )
                                .scaleEffect(x: -1, y: 1)
                            HStack{
                                if hangulCard.hangulType == .single {
                                    Text(hangulCard.name)
                                        .bold()
                                        .font( cardType.explanationFont(.vowel))
                                        .foregroundColor(.blue)
                                    +
                                    Text(" is pronunce like ")
                                        .bold()
                                        .font( cardType.explanationFont(.vowel))
                                    +
                                    Text("[")
                                        .bold()
                                        .font( cardType.explanationFont(.vowel))
                                        .foregroundColor(Color(uiColor: .systemGray4))
                                    +
                                    Text(hangulCard.sound)
                                        .bold()
                                        .font( cardType.explanationFont(.vowel))
                                    +
                                    Text("]")
                                        .bold()
                                        .font( cardType.explanationFont(.vowel))
                                        .foregroundColor(Color(uiColor: .systemGray4))
                                    +
                                    Text(" in \(hangulCard.explanation)")
                                        .bold()
                                        .font( cardType.explanationFont(.vowel))
                                } else {
                                    Text("Pronounce as \(hangulCard.explanation) simultaneously")
                                        .bold()
                                        .font( cardType.explanationFont(.vowel))
                                }
                            }
                            .frame(width: cardType.imageFrame)
                            .scaleEffect(x: -1, y: 1)
                            .multilineTextAlignment(.center)
                            
                        } else {
                            Rectangle()
                                .foregroundStyle(.clear)
                                .border(.black)
                                .frame(width: cardType.imageFrame , height: cardType.imageFrame)
                                .scaleEffect(x: -1, y: 1)
                            
                            Text("[]")
                                .bold()
                                .font(cardType.explanationFont(.batchim))
                                .scaleEffect(x: -1, y: 1)
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
        .rotation3DEffect(isFlipped ? Angle(degrees: 180) : .zero,
                          axis: (x: 0.0, y: 1.0, z: 0.0))
        .animation(.easeInOut(duration: 0.5), value: isFlipped)
        .contentShape(Rectangle())
        .gesture(
            TapGesture()
                .onEnded {
                    if !isOnceFlipped && cardType != .small {
                        isOnceFlipped = true
                    }
                    isFlipped.toggle()
                    self.onTapGesture()
                }
        )
        .onChange(of: hangulCard){
            withAnimation (.easeIn(duration: 1)){
                isOnceFlipped = false
                isFlipped = false
            }
        }
    }
}

#Preview {
    HangulCardView(onTapGesture: {},hangulCard: HangulUnitEnum.vowel1[0], cardType: .large)
        .environmentObject(EducationManager())
}
