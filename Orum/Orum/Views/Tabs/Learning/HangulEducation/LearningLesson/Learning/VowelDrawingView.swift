//
//  VowelDrawingView.swift
//  Orum
//
//  Created by 차차 on 11/8/23.
//

import SwiftUI

struct VowelDrawingView: View {
    @Binding var progressValue: Int
    @State var isPresented = false
    
    @EnvironmentObject var educationManager: EducationManager
    
    @State var writingCount = 0
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    ProgressView(value: Double(progressValue) / Double(educationManager.content.count * 2 + 2))
                        .padding(.vertical, 16)
                        .padding(.horizontal, 16)
                    
                    Canvas(writingCount: $writingCount)
                        .environmentObject(educationManager)
                        .overlay {
                            VStack {
                                Text("\(writingCount)/3")
                                    .foregroundStyle(writingCount < 3 ? Color(uiColor: .secondaryLabel) : .accentColor) // MARK: 색상 변경 되는 것은 별로?
                                
                                Text("Draw vowel along the lines")
                                    .multilineTextAlignment(.center)
                                    .bold()
                                    .font(.largeTitle)
                                
                                Spacer()
                            }
                        }
                }
                .frame(height: UIScreen.main.bounds.height - safeArea().top - UIScreen.main.bounds.height *  0.15)

                
                Spacer()
            }
            
            VStack {
                Spacer()
                
                ZStack {
                    Rectangle()
                        .foregroundStyle(.ultraThinMaterial)
                        .frame(height: UIScreen.main.bounds.height * 0.15)
                    
                    VStack(spacing: 0){
                        
                        Button(action: {
                            educationManager.currentEducation = .learning
                            progressValue += 1
                            
                        },label: {
                            Text("Continue")
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 8)
                                .bold()
                        })
                        .buttonStyle(.borderedProminent)
                        .padding(.horizontal, 24)
                        .padding(.top, 24)
                        .disabled(writingCount < 3)
                        .padding(.bottom, 48)
                    }
                }
            }
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

#Preview {
    VowelDrawingView( progressValue: .constant(0))
        .environmentObject(EducationManager())
}
