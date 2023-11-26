//
//  BasicVowelCheckView.swift
//  Orum
//
//  Created by 차차 on 11/14/23.
//

import SwiftUI

struct BasicVowelCheckView: View {
    @Binding var progressValue: Int
    
    @EnvironmentObject var educationManager: EducationManager
    
    private var str: [String] {
        if educationManager.index == 1 {
            return ["ㅡ","ㅣ"]
        }
        else if educationManager.index == 5 {
            return ["ㅏ","ㅓ","ㅗ","ㅜ"]
        }
        else {
            return ["ㅐ","ㅔ"]
        }
    }
    
    private var strExplain: String {
        if educationManager.index == 1 {
            return "These vowels have the most minimalistic forms"
        }
        else if educationManager.index == 5 {
            return "These vowels are distinguished by top, bottom, left, and right positions."
        }
        else {
            return "These vowels have similar shapes and the same pronunciation."
        }
    }
    
    var body: some View {
        ZStack {
            ScrollView{
                VStack(spacing: 16) {
                    ProgressView(value: Double(progressValue) / Double(educationManager.content.count * 2 + 2))
                    
                    Text("Intermission")
                        .bold()
                        .foregroundStyle(Color(uiColor: .secondaryLabel))
                    
                    Text("Compare Difference")
                        .bold()
                        .font(.largeTitle)
                    
                    BatchimExplainView(explainTitle: "\(str.concatArray(isComma: true))", explain: strExplain)
                        
                    
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)], content: {
                        ForEach(str, id: \.self) { name in
                            HangulCardView(onTapGesture: {},hangulCard: HangulCard(name: name), cardType: .medium, canBorderColorChange: false)
                        }
                    })

                }
                .padding(.horizontal, 16)
            }
            
            VStack {
                Spacer()
                
                ZStack {
                    Rectangle()
                        .foregroundStyle(.ultraThinMaterial)
                        .frame(height: UIScreen.main.bounds.height * 0.15)
                    
                    VStack(spacing: 0) {
                        
                        Button(action: {
                            if educationManager.index < 7 {
                                progressValue += 1
                                educationManager.index += 1
                                educationManager.currentEducation = .vowelDrawing
                            }
                            else {
                                progressValue += 1
                                educationManager.currentEducation = .recap
                            }
                        },label: {
                            Text("Next")
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

#Preview {
    BasicVowelCheckView(progressValue: .constant(0))
        .environmentObject(EducationManager())
}
