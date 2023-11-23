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
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())],spacing: 16) {
                            ForEach(0 ..< 14) { index in
                                HangulCardView(onTapGesture: {}, hangulCard: HangulCard(name: Constants.Hangul.consonants[index]), cardType: .small)
                            }
                        }
                    }
                    else {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())],spacing: 16) {
                            ForEach(0 ..< 21) { index in
                                HangulCardView(onTapGesture: {}, hangulCard: HangulCard(name: Constants.Hangul.vowels[index]), cardType: .small)
                            }
                        }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)
            }
            .navigationTitle(chapterName)
            .navigationBarTitleDisplayMode(.inline)
            .scrollIndicators(.hidden)
    }
}

#Preview {
    CollectionDetailView(chapterName: .constant("Consonant"))
        .environmentObject(EducationManager())
}
