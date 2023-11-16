//
//  VowelDrawingView.swift
//  Orum
//
//  Created by 차차 on 11/8/23.
//

import SwiftUI

struct VowelDrawingView: View {
    @Binding var currentEducation: CurrentEducation
    @Binding var progressValue: Int
    @Binding var isPresented: Bool
    @State var writingCount = 0
    @EnvironmentObject var educationManager: EducationManager
    
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                ProgressView(value: Double(progressValue) / Double(educationManager.content.count * 2 + 2))
                    .padding(.vertical, 16)
                
                //            Divider()
                Canvas(writingCount: $writingCount)
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
                        currentEducation = .learning
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
    VowelDrawingView(currentEducation: .constant(.vowelDrawing), progressValue: .constant(0), isPresented: .constant(false))
        .environmentObject(EducationManager())
}
