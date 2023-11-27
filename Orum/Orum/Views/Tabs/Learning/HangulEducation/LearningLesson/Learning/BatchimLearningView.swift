//
//  BatchimLearningView.swift
//  Orum
//
//  Created by Youngbin Choi on 11/21/23.
//

import SwiftUI

struct BatchimLearningView: View {
    
    @EnvironmentObject var educationManager: EducationManager
    
    @Binding var progressValue: Int
    @Binding var currentEducation: CurrentEducation
    @Binding var isPresented: Bool
    
    @State var touchCardsCount : Int = 0
    @State var isCardView = false
    
    var lessonName : String {
        educationManager.nowStudying
    }
    
    var pageIndex : Int {
        educationManager.index
    }
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    Rectangle()
                        .foregroundStyle(.clear)
                        .frame(height: 32)
                    
                    VStack {
                        if ((Constants.Hangul.batchimCardCount[lessonName]?[pageIndex])! > 1) {
                            VStack(spacing: 16) {
                                VStack(spacing: 0) {
                                    Text("Principle")
                                        .font(.body)
                                        .fontWeight(.bold)
                                        .foregroundStyle(.secondary)
                                    
                                    Text(Constants.Hangul.batchimTitle[lessonName]![pageIndex])
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.center)
                                }
                                
                                BatchimExplainView(
                                    explainTitle: "\( Constants.Hangul.batchimExplainTitle[lessonName]![pageIndex])",
                                    explain: Constants.Hangul.batchimExplain[lessonName]![pageIndex])
                                
                                
                                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 15), GridItem(.flexible())], spacing: 15) {
                                        ForEach(0 ..< (Constants.Hangul.batchimCardCount[lessonName]?[pageIndex])!, id: \.self) { index in
                                            HangulCardView(onTapGesture: {}, hangulCard: educationManager.content[pageIndex == 0 ? index : index + 4], cardType: .medium, canBorderColorChange: true)
                                        }
                                    }

                                
                            }
                            .padding(.horizontal, 7)
                            .padding(.bottom, 130)
                        } 
                        else {
                            VStack(spacing: 16) {
                                VStack(spacing: 0) {
                                    Text("\(touchCardsCount)/1")
                                        .font(.body)
                                        .fontWeight(.bold)
                                        .foregroundStyle(.secondary)
                                    
                                    Text(Constants.Hangul.batchimTitle[lessonName]![pageIndex])
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.center)
                                }
                                
                                BatchimExplainView(
                                    explainTitle: "\( Constants.Hangul.batchimExplainTitle[lessonName]![pageIndex])",
                                    explain: Constants.Hangul.batchimExplain[lessonName]![pageIndex])
                                
                                HangulCardView(onTapGesture: {
                                    touchCardsCount += 1
                                }, hangulCard: HangulCard(name: "ㅇb"), cardType: .large, canBorderColorChange: true)
                                .padding(.horizontal, 48)
                            }
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
            
            VStack {
                Spacer()
                
                ZStack {
                    Rectangle()
                        .foregroundStyle(.ultraThinMaterial)
                        .frame(height: UIScreen.main.bounds.height * 0.15)
                    
                    VStack(spacing: 0) {
                        
                        Button(action: {
                            if educationManager.index < 1 {
                                educationManager.index += 1
                                isCardView.toggle()

                            } 
                            else {
                                withAnimation(.easeIn(duration: 0.5)) {
                                    educationManager.currentEducation = .recap

                                }
                            }
                        },label: {
                            Text("Continue")
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 8)
                                .bold()
                        })
                        .buttonStyle(.borderedProminent)
                        .disabled(lessonName == Constants.Lesson.batchim1 && isCardView && touchCardsCount < 1 ? true : false)
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

#Preview {
    BatchimLearningView(progressValue: .constant(0), currentEducation: .constant(.batchim), isPresented: .constant(true))
        .environmentObject(EducationManager())
}
