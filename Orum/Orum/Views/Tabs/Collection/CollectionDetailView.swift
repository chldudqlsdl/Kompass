//
//  CollectionDetailView.swift
//  Orum
//
//  Created by 차차 on 11/15/23.
//

import SwiftUI

struct CollectionDetailView: View {
    @Binding var chapterName: String
    
    @EnvironmentObject var educationManager: EducationManager
    
    var body: some View {
            ScrollView {
                VStack {
                    if chapterName == "Consonant" {
                        LazyVGrid(columns: [GridItem(.flexible(),spacing: 15), GridItem(.flexible(),spacing: 15)],spacing: 16) {
                            ForEach(0 ..< Constants.Hangul.consonants.count) { index in
                                HangulCardView(onTapGesture: {}, hangulCard: HangulCard(name: Constants.Hangul.consonants[index]), cardType: .medium, canBorderColorChange: false)
                            }
                        }
                    }
                    else if chapterName == "Vowel" {
                        LazyVGrid(columns: [GridItem(.flexible(),spacing: 15), GridItem(.flexible(),spacing: 15)],spacing: 16) {
                            ForEach(0 ..< 21) { index in
                                HangulCardView(onTapGesture: {}, hangulCard: HangulCard(name: Constants.Hangul.vowels[index]), cardType: .medium, canBorderColorChange: false)
                            }
                        }
                    }
                    else {
                        BatchimView()
                    }
                }
                .padding(.horizontal, 16)
            }
            .navigationTitle(chapterName)
            .navigationBarTitleDisplayMode(.inline)
            .scrollIndicators(.hidden)
    }
    
    @ViewBuilder 
    func Element(consonant: String) -> some View {
        Text(consonant)
            .bold()
            .font(.largeTitle)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .foregroundStyle(Color(uiColor: .quaternarySystemFill))
            )
    }

    
    @ViewBuilder
    func ExplainView(pronounciation: String, explanation: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
                Divider()

                Text(pronounciation)
                    .bold()
                    .font(.footnote)
                    .foregroundStyle(Color(uiColor: .secondaryLabel))
                
                Text(explanation)
                    .padding(.trailing, 16)
            }

    }
    
    @ViewBuilder
    func ExplainBox(title: String, content: some View) -> some View {
        VStack(spacing: 8) {
            Text(title)
                .bold()
                .font(.largeTitle)
                .foregroundStyle(Color.accentColor)
                .padding(.top, 16)
            
                content
                    .padding(.leading, 16)
                    .padding(.bottom, 15)

        }
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(uiColor: .quaternarySystemFill))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .strokeBorder(Color(uiColor: .secondarySystemFill), lineWidth: 0.5, antialiased: true)
        )
    }
    
    private func BatchimView() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 9) {
                Element(consonant: "ㄱ")
                    
                
                Image(systemName: "chevron.left")
                    .bold()
                    .font(.title2)
                    .foregroundStyle(Color.accentColor)
                    .padding(.horizontal, 7)

                
                Element(consonant: "ㅋ")
                    .foregroundStyle(Color.accentColor)

                
                Element(consonant: "ㄲ")
                    .foregroundStyle(Color.accentColor)

                Spacer()
            }

            Element(consonant: "ㄴ")

            HStack(spacing: 9) {
                Text("ㄷ")
                    .bold()
                    .font(.largeTitle)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 32)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundStyle(Color(uiColor: .quaternarySystemFill))
                    )
                
                    
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Image(systemName: "chevron.left")
                            .bold()
                            .font(.title2)
                            .foregroundStyle(Color.accentColor)
                            .padding(.horizontal, 7)

                        
                        Element(consonant: "ㅌ")
                            .foregroundStyle(Color.accentColor)

                    }
                    
                    HStack {
                        Image(systemName: "chevron.left")
                            .bold()
                            .font(.title2)
                            .foregroundStyle(Color.accentColor)
                            .padding(.horizontal, 7)
                        
                        HStack(spacing: 24) {
                            Text("ㅅ")
                                .bold()
                                .font(.largeTitle)
                                .foregroundStyle(Color.accentColor)
                            
                            Text("ㅈ")
                                .bold()
                                .font(.largeTitle)
                                .foregroundStyle(Color.accentColor)
                            
                            Text("ㅊ")
                                .bold()
                                .font(.largeTitle)
                                .foregroundStyle(Color.accentColor)
                            
                            Text("ㅆ")
                                .bold()
                                .font(.largeTitle)
                                .foregroundStyle(Color.accentColor)
                        }
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundStyle(Color(uiColor: .quaternarySystemFill))
                        )
                    }
                }
            }

            Element(consonant: "ㄹ")

            Element(consonant: "ㅁ")

            HStack(spacing: 9) {
                Element(consonant: "ㅂ")
                
                Image(systemName: "chevron.left")
                    .bold()
                    .font(.title2)
                    .foregroundStyle(Color.accentColor)
                    .padding(.horizontal, 7)
                
                Element(consonant: "ㅍ")
                    .foregroundStyle(Color.accentColor)
            }
            
            Element(consonant: "ㅇ")
            
            ExplainBox(title: "ㅎ", content:
                        VStack(alignment: .leading, spacing: 24) {
                            ExplainView(pronounciation: "좋아요 -> 조아요", explanation: "When ‘ㅎ’ is followed by a vowel-initial ending or suffix, ‘ㅎ’ is not pronounced.")
                            
                            ExplainView(pronounciation: "좋다 -> 조타", explanation: "When ‘ㅎ’ is followed by ‘ㄱ, ㄷ, ㅈ’ it is pronounced as ‘ㅋ, ㅌ, ㅊ’ by merging with the initial sound of the following syllable")
                            
                            ExplainView(pronounciation: "좋소 -> 조쏘", explanation: "When ‘ㅎ’ is followed by ‘ㅅ’, ‘ㅅ’ is pronounced as ㅆ")
                            
                            ExplainView(pronounciation: "놓는 -> 논는", explanation: "When ‘ㅎ’ is followed by ‘ㄴ’, it is pronounced as ‘ㄴ’")
                        }

            )
            
            ExplainBox(title: "ㄳㄵㄽㄾㅀㅄㄶ", content:
                            ExplainView(pronounciation: "싫어요 -> 실어요", explanation: "These are pronounced with the preceding consonant sound.")
            )
            
            ExplainBox(title: "ㄺㄻㄼㄿ", content:
                            ExplainView(pronounciation: "닭 -> 닥", explanation: "These are pronounced with the consonant that follows")
            )
        }
        .padding(.top, 32)
    }
}


#Preview {
    CollectionDetailView(chapterName: .constant("Batchim"))
        .environmentObject(EducationManager())
}
