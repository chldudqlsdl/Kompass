//
//  HangulEducationRecapView.swift
//  Orum
//
//  Created by Youngbin Choi on 10/31/23.
//

import SwiftUI

struct HangulEducationRecapView: View {
    
    @Binding var progressValue: Int
//    @Binding var currentEducation: CurrentEducation
//    @Binding var isPresented: Bool
    
    @EnvironmentObject var educationManager: EducationManager
    
    var lessonName : String {
        educationManager.nowStudying
    }
    
    var pageIndex : Int {
        educationManager.index
    }
        
    var body: some View {
        ZStack {
            ScrollView{
                VStack {
                    ProgressView(value: Double(progressValue) / Double(educationManager.content.count * 2 + 2))
                        .padding(.vertical, 16)
                    
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
                            BatchimExplainView(explainTitle: Constants.Hangul.batchimExplainTitle[lessonName]![index], explain: Constants.Hangul.batchimExplain[lessonName]![index])
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
            
            //버튼 뒷배경
            VStack {
                Spacer()
                
                HStack {
                    Button(action: {}, label: {
                        Text("background")
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
                
                Button {
                    switch educationManager.chapterType {
                    case .system:
                        break
                    case .consonant:
                        progressValue += 1
                        educationManager.currentEducation = .quiz
                    case .vowel:
                        progressValue += 1
                        educationManager.currentEducation = .vowelQuiz
                    case .batchim:
                        progressValue += 1
                        educationManager.currentEducation = .quiz
//                        isPresented = false
                        educationManager.index = 0
                    }
                } label: {
                    Text("Ready to Quiz")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .bold()
                }
                .buttonStyle(.borderedProminent)
                .padding(24)
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color(uiColor: .systemBackground).opacity(0.0), Color(uiColor: .systemBackground).opacity(1.0)]), startPoint: .top, endPoint: .bottom)
                )}
        }
        
        
    }
}

#Preview {
    HangulEducationRecapView(progressValue: .constant(0))
        .environmentObject(EducationManager())
}
