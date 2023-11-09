//
//  HangulEducationView.swift
//  Orum
//
//  Created by 차차 on 10/31/23.
//

import SwiftUI

struct HangulEducationView: View {
    
    @Binding var isPresented: Bool
    
    @EnvironmentObject var educationManager: EducationManager
    
    @State var currentEducation: CurrentEducation = .onboarding
    @State var progressValue : Int = 0
    @State var touchCardsCount : Int = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    ProgressView(value: Double(progressValue) / Double(educationManager.content.count * 2 + 2))
                        .padding(16)
                    
                    Divider()
                    
                    switch currentEducation {
                    case .onboarding:
                        HangulEducationOnboardingView(currentEducation: $currentEducation, progressValue: $progressValue, isPresented: $isPresented)
                            .environmentObject(educationManager)
                            .padding(16)
                        
                    case .vowelDrawing:
                        VowelDrawingView(currentEducation: $currentEducation)
                            .environmentObject(educationManager)
                            .padding(16)
                        
                    case .learning:
                        HangulEducationLearningView(progressValue: $progressValue, currentEducation: $currentEducation)
                            .environmentObject(educationManager)
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                            .transition(.opacity)
                        
                    case .recap:
                            HangulEducationRecapView(progressValue: $progressValue, currentEducation: $currentEducation)
                                .environmentObject(educationManager)
                                .padding(.horizontal, 16)
                        
                    case .vowelQuiz:
                        SameCardCollectingQuizView(currentEducation: $currentEducation, progressValue: $progressValue)
                            .environmentObject(educationManager)
                            .padding(16)
                        
                    case .quiz:
                        HangulEducationQuizView(progressValue: $progressValue, isPresented: $isPresented)
                            .environmentObject(educationManager)
                            .padding(16)
                            .transition(.opacity)
                    }
                    
                    Spacer()
                }
                .navigationTitle(educationManager.nowStudying)
                .navigationBarTitleDisplayMode(.automatic)
                .navigationBarItems(leading: Button(action: {
                    isPresented.toggle()
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(.blue, Color(uiColor: .secondarySystemFill))
                        .symbolRenderingMode(.palette)
                }))
            }
            .edgesIgnoringSafeArea([.bottom])
        }
    }
}

enum CurrentEducation {
    case onboarding
    case vowelDrawing
    case learning
    case recap
    case vowelQuiz
    case quiz
}

#Preview {
    HangulEducationView(isPresented: .constant(true))
        .environmentObject(EducationManager())
}
