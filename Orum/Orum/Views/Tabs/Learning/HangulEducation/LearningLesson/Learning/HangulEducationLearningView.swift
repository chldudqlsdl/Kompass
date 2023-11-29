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
    @State var isExample1Touched = false
    @State var isExample2Touched = false
    @State var isButtonPressed = false
    
    @EnvironmentObject var educationManager: EducationManager
    
    @Namespace var bottomID
    
    let ttsManager = TTSManager()
    
    @Binding var progressValue: Int
    
    var body: some View {
        
        ScrollViewReader { proxy in
            ZStack {
                ScrollView {
                    VStack {
                        Rectangle()
                            .foregroundStyle(.clear)
                            .frame(height: 32)
                        
                        VStack {
                            Text("\(touchCardsCount)/3")
                                .font(.body)
                                .fontWeight(.bold)
                                .foregroundStyle(.secondary)
                            
                            Text("Touch the Cards")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                        }
                        
                        if educationManager.nowStudying == Constants.Lesson.vowel1 && educationManager.index == 0 {
                            BatchimExplainView(explainTitle: "\(Image(systemName: "lightbulb.max")) Tip" , explain: "The closest pronunciation in English to the given word, and listen carefully to the Korean pronunciation below")
                                .padding(.bottom, 30)
                        }                        
                        
                        VStack(spacing: 25){
                            HangulCardView(onTapGesture: {
                                if !isOnceFlipped {
                                    touchCardsCount += 1
                                }
                                
                                isOnceFlipped = true
                            }, hangulCard: educationManager.content[educationManager.index], cardType: .large, canBorderColorChange: true)
                            .environmentObject(educationManager)
                            
                            if educationManager.chapterType == .consonant || educationManager.chapterType == .vowel {
                                HStack(spacing: 17) {
                                    HStack(spacing: 0) {
                                        Text(educationManager.content[educationManager.index].example1)
                                            .bold()
                                            .font(.title2)
                                        
                                        Text(" ")
                                            .bold()
                                            .font(.title2)
                                        
                                        if #available(iOS 17.0, *) {
                                            Image(systemName: "speaker.wave.2.fill")
                                                .bold()
                                                .font(.caption)
                                                .symbolEffect(.bounce, value: isExample1Touched)
                                        }
                                        else {
                                            Image(systemName: "speaker.wave.2.fill")
                                                .bold()
                                                .font(.caption)
                                        }
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding(30)
                                    .overlay(RoundedRectangle(cornerRadius: 24)
                                        .strokeBorder(isExample1Listened ? Color(uiColor: .systemGray4) : .blue , lineWidth: 11))
                                    .onTapGesture {
                                        withAnimation {
                                            isExample1Touched.toggle()
                                        }
                                                                                
                                        if !isExample1Listened {
                                            touchCardsCount += 1
                                        }
                                        withAnimation(.easeIn(duration: 0.5)){
                                            isExample1Listened = true
                                        }
                                        
                                        SoundManager.instance.playSound(sound: "\(educationManager.content[educationManager.index].example1)") {
                                        }
                                    }
                                
                                    
                                    HStack(spacing: 0) {
                                        Text(educationManager.content[educationManager.index].example2)
                                            .bold()
                                            .font(.title2)
                                        
                                        Text(" ")
                                        
                                        if #available(iOS 17.0, *) {
                                            Image(systemName: "speaker.wave.2.fill")
                                                .bold()
                                                .font(.caption)
                                                .symbolEffect(.bounce, value: isExample2Touched)
                                        }
                                        else {
                                            Image(systemName: "speaker.wave.2.fill")
                                                .bold()
                                                .font(.caption)
                                        }
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding(30)
                                    .overlay(RoundedRectangle(cornerRadius: 24)
                                        .strokeBorder(isExample2Listened ? Color(uiColor: .systemGray4) : .blue , lineWidth: 11))
                                    .onTapGesture {
                                        withAnimation {
                                            isExample2Touched.toggle()
                                        }
                                                                                
                                        if !isExample2Listened {
                                            touchCardsCount += 1
                                        }
                                        withAnimation(.easeIn(duration: 0.5)){
                                            isExample2Listened = true
                                        }
                                        
                                        SoundManager.instance.playSound(sound: "\(educationManager.content[educationManager.index].example2)") {
                                        }
                                    }
                                }
                            }
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(.clear)
                                    .id(bottomID)
                            }
                                .padding(.horizontal, 48)
                        }
                        .padding(.horizontal, 16)
                    
                    Spacer()
                        .frame(height: UIScreen.main.bounds.height * 0.15)
                    }
                    
                VStack {
                    Spacer()
                    
                    ZStack {
                        Rectangle()
                            .foregroundStyle(.ultraThinMaterial)
                            .frame(height: UIScreen.main.bounds.height * 0.15)
                        
                        VStack(spacing: 0){
                            
                            Button(action: {
                                if educationManager.index < educationManager.content.count - 1 {
                                    progressValue += 1
                                    
                                    if educationManager.chapterType == .vowel {
                                        if educationManager.nowStudying == Constants.Lesson.vowel1 && (educationManager.index == 1 || educationManager.index == 5 || educationManager.index == 7) {
                                            withAnimation(.easeIn(duration: 0.5)) {
                                                educationManager.currentEducation = .basicVowelCheck
                                            }
                                            
                                            return
                                        }
                                        else {
                                            educationManager.index += 1

                                            withAnimation(.easeIn(duration: 0.5)) {
                                                educationManager.currentEducation = .vowelDrawing
                                                return
                                            }
                                        }
                                    }
                                    else {
                                        
                                        educationManager.index += 1
                                    }
                                }
                                else {
                                    if educationManager.chapterType == .vowel {
                                        if educationManager.nowStudying == Constants.Lesson.vowel1 && educationManager.index == 7 {
                                            withAnimation(.easeIn(duration: 0.5)) {
                                                educationManager.currentEducation = .basicVowelCheck

                                            }

                                            return
                                        }
                                    }
                                    
                                    isOnceFlipped = false
                                    withAnimation(.easeIn(duration: 0.5)) {
                                        progressValue += 1
                                        educationManager.currentEducation = .recap
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
                                    .bold()
                            })
                            .buttonStyle(.borderedProminent)
                            .background((educationManager.index == 0 && isOnceFlipped && isExample1Listened && isExample2Listened) ? .blue.opacity(0.05) : .clear)
                            .disabled(((educationManager.chapterType == .consonant || educationManager.chapterType == .vowel) && (!isOnceFlipped || !isExample1Listened || !isExample2Listened)) || (educationManager.chapterType == .batchim && !isOnceFlipped))
                            .padding(.horizontal, 24)
                            .padding(.top, 24)
                            .padding(.bottom, 48)
                        }
                    }
                }
                .ignoresSafeArea(edges: .bottom)
                }
            }
        }
    }


#Preview {
    HangulEducationLearningView(progressValue: .constant(0))
        .environmentObject(EducationManager())
}


