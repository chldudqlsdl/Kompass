//
//  BasicVowelCheckView.swift
//  Orum
//
//  Created by 차차 on 11/14/23.
//

import SwiftUI

struct BasicVowelCheckView: View {
    @Binding var progressValue: Int
    @Binding var isPresented: Bool
    @Binding var currentEducation: CurrentEducation
    
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
                .navigationTitle(educationManager.nowStudying)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading: Button(action: {
                    isPresented.toggle()
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(.blue, Color(uiColor: .secondarySystemFill))
                        .symbolRenderingMode(.palette)
                }))
            }
            
            //버튼 뒷배경
            VStack {
                Spacer()
                
                HStack {
                    Button(action: {}, label: {
                        Text("background")
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                            .bold()
                    })
                    .buttonStyle(.borderedProminent)
                    .hidden()
                }
                .padding(24)
                .background(.ultraThinMaterial)
            }
            
            VStack {
                Spacer()
                
                Button {
                    if educationManager.index < 7 {
                        progressValue += 1
                        educationManager.index += 1
                        currentEducation = .vowelDrawing
                    }
                    else {
                        progressValue += 1
                        currentEducation = .recap
                    }
                } label: {
                    Text("Next")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .bold()
                }
                .buttonStyle(.borderedProminent)
                .padding(24)
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color(uiColor: .systemBackground).opacity(0.0), Color(uiColor: .systemBackground).opacity(1.0)]), startPoint: .top, endPoint: .bottom)
                )}
        }
    }
}

#Preview {
    BasicVowelCheckView(progressValue: .constant(0), isPresented: .constant(true), currentEducation: .constant(.recap))
        .environmentObject(EducationManager())
}
