//
//  BasicVowelCheckView.swift
//  Orum
//
//  Created by 차차 on 11/14/23.
//

import SwiftUI

struct BasicVowelCheckView: View {
    @Binding var progressValue: Int
//    @Binding var isPresented: Bool
//    @Binding var currentEducation: CurrentEducation
    
    @EnvironmentObject var educationManager: EducationManager
    
    private var str: String {
        if educationManager.index == 1 {
            return "ㅡ,ㅣ"
        }
        else if educationManager.index == 5 {
            return "ㅏ,ㅓ,ㅗ,ㅜ"
        }
        else {
            return "ㅐ,ㅔ"
        }
    }
    
    var body: some View {
        ZStack {
            ScrollView{
                VStack {
                    ProgressView(value: Double(progressValue) / Double(educationManager.content.count * 2 + 2))
                        .padding(.vertical, 16)
                    
                    HStack{
                        Text("\(str)")
                            .font(.largeTitle)
                            .bold()
                        
                        Spacer()
                    }
                    .padding(.bottom, 24)

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
