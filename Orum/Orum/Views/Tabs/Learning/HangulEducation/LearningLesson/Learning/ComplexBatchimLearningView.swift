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
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    Rectangle()
                        .foregroundStyle(.clear)
                        .frame(height: 32)
                    
                    VStack {
                        Text("Principle")
                            .font(.body)
                            .fontWeight(.bold)
                            .foregroundStyle(.secondary)
                        
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
            
            VStack {
                Spacer()
                
                ZStack{
                    Rectangle()
                        .foregroundStyle(.ultraThinMaterial)
                        .frame(height: UIScreen.main.bounds.height * 0.15)
                    
                    VStack(spacing: 0){
                        
                        Button(action: {
                            withAnimation(.easeIn(duration: 0.5)) {
                                educationManager.currentEducation = .end

                            }
                        },label: {
                            Text("Continue")
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
    ComplexBatchimLearningView(progressValue: .constant(0), isPresented: .constant(true))
        .environmentObject(EducationManager())
}
