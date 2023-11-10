//
//  HangulEducationLearningView.swift
//  Orum
//
//  Created by Youngbin Choi on 10/31/23.
//

import SwiftUI

struct HangulEducationLearningView: View {
    @State var touchCardsCount : Int = 0
    @State var isOnceFlipped = false
    @State var isFlipped = false
    @State var isExample1Listened = false
    @State var isExample2Listened = false
    @State var isDrawingViewShowing = true
    
    @EnvironmentObject var educationManager: EducationManager

    @Namespace var bottomID
    
    let ttsManager = TTSManager()
    
    @Binding var progressValue: Int
    @Binding var currentEducation: CurrentEducation
    
    var body: some View {

            ScrollViewReader { proxy in
                ScrollView {
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
                            HangulCardView(onTapGesture: {
                                if !isOnceFlipped {
                                    touchCardsCount += 1
                                }
                                
                                isOnceFlipped = true
                            }, hangulCard: educationManager.content[educationManager.index],  isLearningView: true)
                                    .environmentObject(educationManager)
                            
                            if educationManager.chapterType == .consonant {
                                HStack(spacing: 25) {
                                    Text(educationManager.content[educationManager.index].example1) //TODO: ForEach로 구현하기
                                    .bold()
                                    .frame(maxWidth: .infinity)
                                    .font(.largeTitle)
                                    .padding(15)
                                    .overlay(RoundedRectangle(cornerRadius: 24)
                                        .stroke(isExample1Listened ? Color(uiColor: .systemGray4) : .blue , lineWidth: 11))
                                    .onTapGesture {
                                        if !isExample1Listened {
                                            touchCardsCount += 1
                                        }
                                        withAnimation(.easeIn(duration: 0.5)){
                                            isExample1Listened = true
                                        }
                                        ttsManager.play(educationManager.content[educationManager.index].example1)
                                    }
                                
                                    Text(educationManager.content[educationManager.index].example2)
                                    .bold()
                                    .frame(maxWidth: .infinity)
                                    .font(.largeTitle)
                                    .padding(15)
                                    .overlay(RoundedRectangle(cornerRadius: 24)
                                        .stroke(isExample2Listened ? Color(uiColor: .systemGray4) : .blue , lineWidth: 11))
                                    .onTapGesture {
                                        print(isOnceFlipped)
                                        if !isExample2Listened {
                                            touchCardsCount += 1
                                        }
                                        withAnimation(.easeIn(duration: 0.5)){
                                            isExample2Listened = true
                                        }
                                        ttsManager.play(educationManager.content[educationManager.index].example2)
                                    }
                            }
                        }
                            
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(.clear)
                                .id(bottomID)
                        }
                        .padding(.horizontal, 61)
                        .onChange(of: (!(educationManager.index == 0) || !isOnceFlipped || !isExample1Listened || !isExample2Listened)) {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                withAnimation(.easeOut(duration: 0.3)) {
                                    proxy.scrollTo(bottomID)
                                }
                            }
                        }
                        
                        Button(action: {
                            if educationManager.index < educationManager.content.count - 1 {
                                educationManager.index += 1
                                progressValue += 1
                                
                                if educationManager.chapterType == .vowel {
                                    currentEducation = .vowelDrawing
                                }
                            }
                            else {
                                isOnceFlipped = false
                                educationManager.index = 0
                                withAnimation(.easeIn(duration: 1)) {
                                    progressValue += 1
                                    currentEducation = .recap
                                }
                            }
                            
                            withAnimation (.easeIn(duration: 1)){
                                isOnceFlipped = false
                                isExample1Listened = false
                                isExample2Listened = false
                                touchCardsCount = 0
                            }
                        },label: {
                            Text("Continue")
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 8)
                        })
                        .background((educationManager.index == 0 && isOnceFlipped && isExample1Listened && isExample2Listened) ? .blue.opacity(0.05) : .clear)
                        .buttonStyle(.borderedProminent)
                        .disabled((educationManager.chapterType == .consonant && (!isOnceFlipped || !isExample1Listened || !isExample2Listened)) || (educationManager.chapterType == .vowel && !isOnceFlipped))
                        //                    .padding(EdgeInsets(top: 16, leading: 16, bottom: 50, trailing: 16))
                    }
                }
                //            .scrollDisabled(!(content.unitIndex == 0) || !isOnceFlipped || !isExample1Listened || !isExample2Listened)
            }
    }
}


#Preview {
    HangulEducationLearningView(progressValue: .constant(0), currentEducation: .constant(.learning))
        .environmentObject(EducationManager())
}


