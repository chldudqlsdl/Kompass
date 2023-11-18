//
//  HangulEducationOnboardingView.swift
//  Orum
//
//  Created by Youngbin Choi on 11/6/23.
//

import SwiftUI

struct HangulEducationInstructionView: View {
    @Binding var currentEducation: CurrentEducation
    @Binding var progressValue: Int
    @Binding var isPresented: Bool
    
    @EnvironmentObject var educationManager: EducationManager
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    ProgressView(value: Double(progressValue) / Double(educationManager.content.count * 2 + 2))
                        .padding(.vertical, 16)
                    
                    switch educationManager.chapterType {
                    case .system:
                        Spacer()
                    case .consonant: // Consonant4 (ㄲ,ㄸ,ㅃ,ㅆ,ㅉ)
                        ConsonantOnboarding()
                    case .vowel: // Vowel1, Vowel2, Vowel3
                        Spacer()
                    case .batchim: // Batchim1, Batchim2
                        Spacer()
                    }
                }
                .padding(.horizontal, 16)
                .navigationTitle(educationManager.nowStudying)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading: Button(action: {
                    isPresented.toggle()
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title3)
                        .foregroundStyle(.blue, Color(uiColor: .secondarySystemFill))
            }))
            }
            
            // 버튼 뒷 배경
            VStack {
                Spacer()
                
                HStack {
                    Button(action: {}, label: {
                        Text("Continue")
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
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
                    switch educationManager.chapterType {
                    case .system:
                        isPresented.toggle()
                    case .consonant:
                        currentEducation = .learning
                        progressValue += 1
                    case .vowel:
                        currentEducation = .vowelDrawing
                        progressValue += 1
                    case .batchim:
                        currentEducation = .learning
                        progressValue += 1
                    }
                }, label: {
                    Text("Continue")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .bold()
                })
                .buttonStyle(.borderedProminent)
                .padding(.horizontal, 24)
                .padding(.bottom, 24)
            }
        }
    }
}

#Preview {
    HangulEducationInstructionView(currentEducation: .constant(.instruction), progressValue: .constant(0),isPresented: .constant(false))
        .environmentObject(EducationManager())
}
