//
//  ComplexBatchimLearningView.swift
//  Orum
//
//  Created by Youngbin Choi on 11/22/23.
//

import SwiftUI

struct ComplexBatchimLearningView: View {
    
    @EnvironmentObject var educationManager: EducationManager
    
    @Binding var progressValue: Int
    @Binding var currentEducation: CurrentEducation
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    ProgressView(value: Double(progressValue) / Double(educationManager.content.count * 2 + 2))
                        .padding(.vertical, 16)
                    
                    VStack {
                        Text("Principle")
                            .font(.body)
                            .fontWeight(.bold)
                            .foregroundStyle(.secondary)
                            .onAppear{
                                print(educationManager.nowStudying)
                            }
                        
                        Text("Complex Batchim")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                        VStack(spacing: 20){
                            ComplexBatchimExplainView(batchim: "ㅎ", example: ["좋아요", "조아요"], explain: "The final consonant 'ㅎ' has four complex rules, but the above rule is the most common. The remaining rules are too difficult, so I will just write them down in the collection.")
                            ComplexBatchimExplainView(batchim: "ㄳㄵㄽㄾㅀㅄㄶ", example: ["싫어요", "실어요"], explain: "These are pronounced with the preceding consonant sound")
                            ComplexBatchimExplainView(batchim: "ㄺㄻㄼㄿ", example: ["닭", "닥"], explain: "These are pronounced with the consonant that follows")
                        }
                        
                        Rectangle()
                            .foregroundColor(Color(uiColor: .clear))
                            .frame(height: 100)
                    }
                }
                .padding(.horizontal, 16)
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
                    isPresented = false
                    educationManager.index = 0
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

struct ComplexBatchimExplainView: View {
    
    var batchim : String
    var example : [String]
    var explain : String
    
    var body: some View {
        VStack{
            VStack{
                Text(batchim)
                    .bold()
                    .font(.largeTitle)
                    .foregroundStyle(.blue)
                HStack{
                    Text(example[0])
                        .font(.footnote)
                        .bold()
                    Image(systemName: "arrow.right")
                        .font(.footnote)
                        .bold()
                    Text(example[1])
                        .font(.footnote)
                        .bold()
                }
            }
            .padding(EdgeInsets(top: 16, leading: 16, bottom: 5, trailing: 16))
            Divider()
                .padding(.leading, 16)
            VStack{
                Text(explain)
                    .padding()
            }
        }
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(uiColor: .quaternarySystemFill))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .strokeBorder(Color(uiColor: .secondarySystemFill), lineWidth: 0.5, antialiased: true)
        )
    }
}

#Preview {
    ComplexBatchimLearningView(progressValue: .constant(0), currentEducation: .constant(.learning), isPresented: .constant(true))
        .environmentObject(EducationManager())
}
