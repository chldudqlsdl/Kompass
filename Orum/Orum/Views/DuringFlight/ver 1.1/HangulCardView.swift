//
//  HangulCardView.swift
//  Orum
//
//  Created by Youngbin Choi on 10/31/23.
//

import SwiftUI

enum ViewType {
    case learningView, recapView
}

struct HangulCardView: View {
    @EnvironmentObject var educationManager: EducationManager
    var onTapGesture: () -> Void
    var hangulCard: HangulCard
    @State var isFlipped: Bool = false
    @State var isOnceFlipped: Bool = false
    
    var isLearningView: Bool
    
    var body: some View {
        ZStack{
            HStack{
                
                Spacer()
                
                VStack(spacing: 16){
                    if !isFlipped {
                        Image(hangulCard.name)
                            .resizable()
                            .frame(width: isLearningView ? 180 : 130 , height: isLearningView ? 180 : 130)
                        
                        ZStack{
                            Text(hangulCard.sound)
                                .fontWeight(.bold)
                                .font( isLearningView ? .largeTitle : .title2)
                            
                            Text("[   ]")
                                .fontWeight(.bold)
                                .font( isLearningView ? .largeTitle : .title2)
                                .foregroundColor(Color(uiColor: .systemGray4))
                        }
                    } else {
                        if educationManager.chapterType == .consonant {
                            LottieView(fileName: hangulCard.name)
                                .frame(width: isLearningView ? 180 : 130 , height: isLearningView ? 180 : 130)
                                .scaleEffect(x: -1, y: 1)
                            HStack {
                                Spacer()
                                
                                Text("[")
                                    .fontWeight(.bold)
                                    .font( isLearningView ? .largeTitle : .title2)
                                    .foregroundColor(Color(uiColor: .systemGray4))
                                +
                                Text(hangulCard.lottieName)
                                    .fontWeight(.bold)
                                    .font( isLearningView ? .largeTitle : .title2)
                                +
                                Text("]")
                                    .fontWeight(.bold)
                                    .font( isLearningView ? .largeTitle : .title2)
                                    .foregroundColor(Color(uiColor: .systemGray4))
                                
                                Spacer()
                            }
                            .scaleEffect(x: -1, y: 1)
                        }
                        
                        else {
                            Rectangle()
                                .foregroundStyle(.clear)
                                .border(.black)
                                .frame(width: isLearningView ? 180 : 130 , height: isLearningView ? 180 : 130)
                                .scaleEffect(x: -1, y: 1)
                            
                            Text("[]")
                                .bold()
                                .font( isLearningView ? .largeTitle : .title2)
                                .scaleEffect(x: -1, y: 1)
                        }
                        
                    }
                }
                .padding(EdgeInsets(top: isLearningView ? 50 : 20 , leading: 0, bottom: isLearningView ? 40 : 20, trailing: 0))
                
                Spacer()
            }
        }
        .overlay(RoundedRectangle(cornerRadius: 24)
            .stroke(isOnceFlipped ? Color(uiColor: .systemGray4) : .blue , lineWidth: 11))
        .rotation3DEffect(isFlipped ? Angle(degrees: 180) : .zero,
                          axis: (x: 0.0, y: 1.0, z: 0.0))
        .animation(.easeInOut(duration: 0.5), value: isFlipped)
        .gesture(
            TapGesture()
                .onEnded {
                    if !isOnceFlipped && isLearningView {
                            isOnceFlipped = true
                    }
                    
                    isFlipped.toggle()
                    
                    self.onTapGesture()
                }
        )
        .onChange(of: hangulCard){
            withAnimation (.easeIn(duration: 1)){
                isOnceFlipped = false
                isFlipped = false
            }
        }
    }
}

#Preview {
    HangulCardView(onTapGesture: {},hangulCard: HangulUnitEnum.consonant1[1], isLearningView: false)
        .environmentObject(EducationManager())
}
