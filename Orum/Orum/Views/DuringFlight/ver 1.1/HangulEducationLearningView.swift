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
    
    @State var index: Int = 0
    @Binding var progressValue: Int
    @Binding var currentEducation: CurrentEducation
    @Binding var isPresented: Bool
    
    var body: some View {

            ScrollViewReader { proxy in
                ZStack {
                    ScrollView {
                        VStack {
                            ProgressView(value: Double(progressValue) / Double(educationManager.content.count * 2 + 2))
                                .padding(.vertical, 16)
                            
                            VStack {
                                Text("\(touchCardsCount)/3")
                                    .font(.body)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.secondary)
                                
                                Text("Touch the Cards")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                            }
                            
                            VStack(spacing: 25){
                                HangulCardView(hangulCard: educationManager.content[index], chapterType: educationManager.chapterType, touchCardsCount: $touchCardsCount, isOnceFlipped: $isOnceFlipped, isFlipped: $isFlipped, lottieView: LottieView(fileName: educationManager.content[index].name),  isLearningView: true)
                                    .environmentObject(educationManager)
                                
                                if educationManager.chapterType == .consonant {
                                    HStack(spacing: 25) {
                                    Text(educationManager.content[index].example1) //TODO: ForEach로 구현하기
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
                                            ttsManager.play(educationManager.content[index].example1)
                                        }
                                    
                                    Text(educationManager.content[index].example2)
                                        .bold()
                                        .frame(maxWidth: .infinity)
                                        .font(.largeTitle)
                                        .padding(15)
                                        .overlay(RoundedRectangle(cornerRadius: 24)
                                            .stroke(isExample2Listened ? Color(uiColor: .systemGray4) : .blue , lineWidth: 11))
                                        .onTapGesture {
                                            if !isExample2Listened {
                                                touchCardsCount += 1
                                            }
                                            withAnimation(.easeIn(duration: 0.5)){
                                                isExample2Listened = true
                                            }
                                            ttsManager.play(educationManager.content[index].example2)
                                        }
                                }
                            }
                                
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(.clear)
                                    .id(bottomID)
                            }
                            .padding(.horizontal, 48)
                            .onChange(of: (!(index == 0) || !isOnceFlipped || !isExample1Listened || !isExample2Listened)) {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                    withAnimation(.easeOut(duration: 0.3)) {
                                        proxy.scrollTo(bottomID)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                    
                    //버튼 뒷배경
                    VStack {
                        Spacer()
                        
                        HStack {
                            Button(action: {}, label: {
                                Text("Continue")
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 8)
                                    .bold()
                            })
                            .buttonStyle(.borderedProminent)
                            .hidden()
                        }
                        .padding(24)
                        .background(.ultraThinMaterial)
                    }
                    
                    VStack {
                        Spacer()
                        
                        Button(action: {
                            if index < educationManager.content.count - 1 {
                                index += 1
                                progressValue += 1
                            }
                            else {
                                isOnceFlipped = false
                                index = 0
                                
                                withAnimation(.easeIn(duration: 1)) {
                                    progressValue += 1
                                    currentEducation = .recap
                                }
                            }
                            
                            withAnimation (.easeIn(duration: 1)){
                                isOnceFlipped = false
                                isFlipped = false
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
                        .background((index == 0 && isOnceFlipped && isExample1Listened && isExample2Listened) ? .blue.opacity(0.05) : .clear)
                        .buttonStyle(.borderedProminent)
                        .disabled((educationManager.chapterType == .consonant && (!isOnceFlipped || !isExample1Listened || !isExample2Listened)) || (educationManager.chapterType == .vowel && !isOnceFlipped))
                    }
                    .padding(24)
                }
                //            .scrollDisabled(!(content.unitIndex == 0) || !isOnceFlipped || !isExample1Listened || !isExample2Listened)
            }
            .navigationTitle(educationManager.nowStudying)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button(action: {
                isPresented.toggle()
            }, label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title3)
                    .foregroundStyle(.blue, Color(uiColor: .secondarySystemFill))
                    .symbolRenderingMode(.palette)
            }))
    }
}


#Preview {
    HangulEducationLearningView(progressValue: .constant(0), currentEducation: .constant(.learning), isPresented: .constant(true))
        .environmentObject(EducationManager())
}


