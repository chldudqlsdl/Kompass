//
//  HangulEducationRecapView.swift
//  Orum
//
//  Created by Youngbin Choi on 10/31/23.
//

import SwiftUI

struct HangulEducationRecapView: View {
    
    @Binding var progressValue: Int
    @Binding var currentEducation: CurrentEducation
    @Binding var isPresented: Bool
    
    @EnvironmentObject var educationManager: EducationManager
        
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
                    
                    
                    VStack {
                        LazyVGrid(columns: [GridItem(.flexible(), spacing: 15), GridItem(.flexible())], spacing: 15) {
                            ForEach(0 ..< educationManager.content.count, id: \.self) { index in
                                HangulCardView(onTapGesture: {}, hangulCard: educationManager.content[index], cardType: .medium)
                            }
                        }

                    }
                    .padding(.horizontal, 7)
                    .padding(.bottom, 130)
                }
                .padding(.horizontal, 16)
                .navigationTitle(educationManager.nowStudying)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading: Button(action: {
                    isPresented.toggle()
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(.blue, Color(uiColor: .secondarySystemFill))
                }))
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
                        currentEducation = .quiz
                    case .vowel:
                        progressValue += 1
                        currentEducation = .vowelQuiz
                    case .batchim:
                        progressValue += 1
                        currentEducation = .quiz
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
    HangulEducationRecapView(progressValue: .constant(0), currentEducation: .constant(.recap), isPresented: .constant(true))
        .environmentObject(EducationManager())
}
