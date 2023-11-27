//
//  HangulEducationRecapView.swift
//  Orum
//
//  Created by Youngbin Choi on 10/31/23.
//

import SwiftUI

struct HangulEducationRecapView: View {
    
    @Binding var progressValue: Int
    
    @EnvironmentObject var educationManager: EducationManager
    
    var lessonName : String {
        educationManager.nowStudying
    }
    
    var pageIndex : Int {
        educationManager.index
    }
    
    var buttonText: String {
        if educationManager.chapterType == .batchim {
            return "Continue"
        }
        else {
            return "Ready to Quiz"
        }
    }
        
    var body: some View {
        ZStack {
            ScrollView{
                VStack {
                    Rectangle()
                        .foregroundStyle(.clear)
                        .frame(height: 32)
                    
                    VStack {
                        Text("Before Quiz")
                            .font(.body)
                            .fontWeight(.bold)
                            .foregroundStyle(.secondary)
                        
                        Text("Recap")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }
                    if educationManager.chapterType == .batchim {
                        
                        ForEach(0 ..< 2){ index in
                            BatchimExplainView(explainTitle: "\( Constants.Hangul.batchimExplainTitle[lessonName]![index])", explain: Constants.Hangul.batchimExplain[lessonName]![index])
                        }
                        
                    } else {
                        VStack {
                            LazyVGrid(columns: [GridItem(.flexible(), spacing: 15), GridItem(.flexible())], spacing: 15) {
                                ForEach(0 ..< educationManager.content.count, id: \.self) { index in
                                    HangulCardView(onTapGesture: {}, hangulCard: educationManager.content[index], cardType: .medium, canBorderColorChange: true)
                                }
                            }
                            
                        }
                        .padding(.horizontal, 7)
                        .padding(.bottom, 130)
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
                    
                    VStack(spacing: 0){
                        
                        Button(action: {
                            switch educationManager.chapterType {
                            case .system:
                                break
                            case .consonant, .vowel:
                                progressValue += 1
                                withAnimation(.easeInOut(duration: 0.5)) {
                                    educationManager.currentEducation = .quiz
                                }
//                            case .vowel:
//                                progressValue += 1
//                                educationManager.currentEducation = .vowelQuiz
                            case .batchim:
                                progressValue += 1
                                withAnimation(.easeIn(duration: 0.5)) {
                                    educationManager.currentEducation = .end

                                }
        //                        isPresented = false
                                educationManager.index = 0
                            }
                        },label: {
                            Text(buttonText)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 8)
                                .bold()
                        })
                        .buttonStyle(.borderedProminent)
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
    HangulEducationRecapView(progressValue: .constant(0))
        .environmentObject(EducationManager())
}
