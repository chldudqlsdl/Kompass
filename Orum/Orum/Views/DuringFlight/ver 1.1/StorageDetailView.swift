//
//  StorageDetailView.swift
//  Orum
//
//  Created by 차차 on 10/31/23.
//

import SwiftUI

struct StorageDetailView: View {
    @Binding var chapterName: String
    
    @EnvironmentObject var educationManager: EducationManager
    
    var body: some View {
            ScrollView {
                VStack {
                    if chapterName == "Consonant" {
                        LazyVGrid(columns: [GridItem(.flexible(), spacing: 15), GridItem(.flexible())],spacing: 16) {
                            ForEach(0 ..< 14) { index in
                                HangulCardView(onTapGesture: {}, hangulCard: HangulUnitEnum.consonant1[0], isLearningView: false)
                            }
                        }
                    }
                    else {
                        LazyVGrid(columns: [GridItem(.flexible(), spacing: 15), GridItem(.flexible())],spacing: 16) {
                            ForEach(0 ..< 21) { index in
                                HangulCardView(onTapGesture: {}, hangulCard: HangulUnitEnum.vowel1[0], isLearningView: false)
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
    StorageDetailView(chapterName: .constant("Vowel"))
        .environmentObject(EducationManager())
}
