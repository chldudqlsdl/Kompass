//
//  HangulEducationView.swift
//  Orum
//
//  Created by 차차 on 10/31/23.
//

import SwiftUI

struct HangulEducationView: View {
    
    @Binding var isPresented: Bool
    @State var content: HangulUnit
    @State var nextpage: Bool = false
    @State var flipCheck : Bool = false
    @State var flipped: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0){
                    VStack{
                        ProgressView(value: 0.2)
                            
                    }
                    .padding(16)
                    
                    Divider()
                    
                    HangulEducationLearningView(content: $content, flipCheck: $flipCheck, flipped: $flipped)
                        .padding(16)
                    
                    Spacer()
                    VStack{
                        Button(action: {
                            content.unitIndex += 1
                            flipCheck = false
                            flipped = false
                        }){
                            HStack{
                                Spacer()
                                Text("Got it!")
                                Spacer()
                            }
                            .padding(.vertical, 5)
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(!flipCheck ? true : false)
                        
                    }
                    .padding(16)
                    
                }
                .navigationTitle(content.unitName)
                .navigationBarItems(leading: Button(action: {
                    isPresented.toggle()
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(.blue, Color(uiColor: .systemGray4))
                        .symbolRenderingMode(.palette)
                })
            }
        }
    }
}

#Preview {
    HangulEducationView(isPresented: .constant(true), content: HangulUnit(unitName: "consonants1", unitIndex: 0, hangulCards: [
        HangulCard(name: "ㄱ", sound: "g", example1: "가", example2: "구", soundExample1: "ga", soundExample2: "gu", quiz: "가든", lottieName: "gun"),
        HangulCard(name: "ㄴ", sound: "n", example1: "나", example2: "누", soundExample1: "na", soundExample2: "nu", quiz: "나노", lottieName: "nose"),
        HangulCard(name: "ㄷ", sound: "d", example1: "다", example2: "두", soundExample1: "da", soundExample2: "du", quiz: "다트", lottieName: "drink"),
        HangulCard(name: "ㄹ", sound: "r", example1: "라", example2: "루", soundExample1: "ra", soundExample2: "ru", quiz: "라디오", lottieName: "road")
    ]))
}
