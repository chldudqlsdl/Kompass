//
//  HangulEducationLearningView.swift
//  Orum
//
//  Created by Youngbin Choi on 10/31/23.
//

import SwiftUI

struct HangulEducationLearningView: View {
    @State var islearningView = true
    @Binding var content : HangulUnit
    @Binding var touchCardsCount : Int
    @Binding var isOnceFlipped : Bool
    @Binding var isFlipped: Bool
    @Binding var isExample1Listened : Bool
    @Binding var isExample2Listened : Bool
    @Namespace var bottomID
    let ttsManager = TTSManager()
    
    @Binding var index: Int
    
    var body: some View {
        ScrollViewReader{ proxy in
            ScrollView{
                VStack(spacing: 50){
                    HStack{
                        Text("Touch the Cards")
                            .font(.title2)
                            .fontWeight(.bold)
                        ZStack{
                            Text("\(touchCardsCount)/3")
                                .font(.body)
                                .fontWeight(.bold)
                        }
                        .padding(EdgeInsets(top: 3, leading: 5, bottom: 3, trailing: 5))
                        .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(.blue , lineWidth: 3))
                        Spacer()
                    }
                    .padding(.top, 16)
                    VStack(spacing: 25){
                        HangulCardView(hangulCard: $content.hangulCards[index], isLearningView: $islearningView, touchCardsCount: $touchCardsCount, isOnceFlipped: $isOnceFlipped, isFlipped: $isFlipped, lottieView: LottieView(fileName: content.hangulCards[index].name))
                        HStack(spacing: 25){
                            HStack{
                                Spacer()
                                Text(content.hangulCards[index].example1)
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .padding(15)
                                
                                Spacer()
                            }
                            .overlay(RoundedRectangle(cornerRadius: 24)
                                .stroke(isExample1Listened ? Color(uiColor: .systemGray4) : .blue , lineWidth: 11))
                            .onTapGesture {
                                if !isExample1Listened {
                                    touchCardsCount += 1
                                }
                                withAnimation(.easeIn(duration: 0.5)){
                                    isExample1Listened = true
                                }
                                ttsManager.play(content.hangulCards[index].example1)
                            }
                            HStack{
                                Spacer()
                                Text(content.hangulCards[index].example2)
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .padding(15)
                                
                                Spacer()
                            }
                            .overlay(RoundedRectangle(cornerRadius: 24)
                                .stroke(isExample2Listened ? Color(uiColor: .systemGray4) : .blue , lineWidth: 11))
                            .onTapGesture {
                                if !isExample2Listened {
                                    touchCardsCount += 1
                                }
                                withAnimation(.easeIn(duration: 0.5)){
                                    isExample2Listened = true
                                }
                                ttsManager.play(content.hangulCards[index].example2)
                            }
                        }
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.clear)
                            .id(bottomID)
                    }
                    .padding(.horizontal, 61)
                    .onChange(of: (!(index == 0) || !isOnceFlipped || !isExample1Listened || !isExample2Listened)) {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            withAnimation(.easeOut(duration: 0.3)) {
                                proxy.scrollTo(bottomID)
                            }
                        }
                    }
                }
            }
//            .scrollDisabled(!(content.unitIndex == 0) || !isOnceFlipped || !isExample1Listened || !isExample2Listened)
        }
    }
}


#Preview {
    HangulEducationLearningView(content: .constant(HangulUnit(unitName: "consonants1", hangulCards: HangulCard.preview)), touchCardsCount: .constant(0), isOnceFlipped: .constant(false), isFlipped: .constant(false), isExample1Listened: .constant(false), isExample2Listened: .constant(false), index: .constant(1))
}


