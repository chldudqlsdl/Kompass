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
    
    var drawingText: String {
        if writingCount < 3 {
            return "\(writingCount)/3"
        }else {
            return "Good!"
        }
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                VStack {
                    Rectangle()
                        .foregroundStyle(.clear)
                        .frame(height: 32)
                    
                    Canvas(writingCount: $writingCount)
                        .environmentObject(educationManager)
                        .overlay {
                            VStack {
                                Text(drawingText)
                                    .bold()
                                    .font(.body)
                                    .foregroundStyle(writingCount < 3 ? Color(uiColor: .secondaryLabel) : .accentColor)
                                
                                Text("Draw vowel along the lines")
                                    .multilineTextAlignment(.center)
                                    .bold()
                                    .font(.largeTitle)
                                
                                Spacer()
                            }
                        }
                }
                
                    Rectangle()
                        .foregroundStyle(.clear)
                        .frame(height: UIScreen.main.bounds.height * 0.15)
                
            }
            .ignoresSafeArea(edges: .bottom)
            
            VStack {
                Spacer()
                
                ZStack {
                    Rectangle()
                        .foregroundStyle(.ultraThinMaterial)
                        .frame(height: UIScreen.main.bounds.height * 0.15)
                    
                    VStack(spacing: 0){
                        
                        Button(action: {
                            withAnimation(.easeIn(duration: 0.5)) {
                                educationManager.currentEducation = .learning

                            }

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
