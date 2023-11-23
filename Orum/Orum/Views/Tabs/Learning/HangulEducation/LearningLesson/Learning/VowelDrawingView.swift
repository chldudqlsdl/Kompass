//
//  VowelDrawingView.swift
//  Orum
//
//  Created by 차차 on 11/8/23.
//

import SwiftUI

struct VowelDrawingView: View {
    @Binding var progressValue: Int
    
    @EnvironmentObject var educationManager: EducationManager
    
    @State var writingCount = 0
    
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                ProgressView(value: Double(progressValue) / Double(educationManager.content.count * 2 + 2))
                    .padding(.vertical, 16)
                
                //            Divider()
                Canvas(writingCount: $writingCount)
            }
            .padding(.horizontal, 16)
            
            // 버튼 뒷 배경
            ZStack{
                VStack {
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
                    Button(action: {
                        educationManager.currentEducation = .learning
                        progressValue += 1
                        
                    }, label: {
                        Text("Continue")
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                            .bold()
                    })
                    .buttonStyle(.borderedProminent)
                    .padding(.horizontal, 24)
//                    .padding(.bottom, 24)
//                    .disabled(writingCount < 3)
                }
            }
        }
    }
}

#Preview {
    VowelDrawingView( progressValue: .constant(0))
        .environmentObject(EducationManager())
}
