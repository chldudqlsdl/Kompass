//
//  HangulEducationRecapView.swift
//  Orum
//
//  Created by Youngbin Choi on 10/31/23.
//

import SwiftUI

struct HangulEducationRecapView: View {
    
    @Binding var progressValue: Int
    @Binding var currentEducation: CurrentEducation
    
    @EnvironmentObject var educationManager: EducationManager
    
    @State var touchCardsCount : Int = 0
    @State var isOnceFlipped : [Bool] = [false,false,false,false,false,false,false,false,false,false]
    @State var isFlipped : [Bool] = [false,false,false,false,false,false,false,false,false,false]
    
    var body: some View {
        ScrollView{
            VStack(spacing: 32){
                HStack{
                    Text("Recap what you learned to prepare Quiz session")
                        .font(.title2)
                        .bold()
                    Spacer()
                }
                .padding(.top, 16)
                
                
                VStack {
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 25), GridItem(.flexible())], spacing: 25) {
                        ForEach(0 ..< educationManager.content.count, id: \.self) { index in
                            HangulCardView(hangulCard: educationManager.content[index], touchCardsCount: $touchCardsCount, isOnceFlipped: $isOnceFlipped[index], isFlipped: $isFlipped[index], lottieView: LottieView(fileName: educationManager.content[index].name), isLearningView: false)
                        }
                    }
                    
                    Button {
                        switch educationManager.chapterType {
                        case .system: 
                            break
                        case .consonant:
                            progressValue += 1
                            currentEducation = .quiz
                        case .vowel:
                            progressValue += 1
                            currentEducation = .vowelQuiz
                        }
                    } label: {
                        HStack{
                            Spacer()
                            Text("Ready to Quiz")
                            Spacer()
                        }
                        .padding(.vertical, 5)
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(EdgeInsets(top: 16, leading: 16, bottom: 50, trailing: 16))
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color(uiColor: .systemBackground).opacity(0.0), Color(uiColor: .systemBackground).opacity(1.0)]), startPoint: .top, endPoint: .bottom)
                    )
                }
                .padding(.horizontal, 7)
                .padding(.bottom, 85)
            }
        }
    }
}

#Preview {
    HangulEducationRecapView(progressValue: .constant(0), currentEducation: .constant(.recap))
        .environmentObject(EducationManager())
}
