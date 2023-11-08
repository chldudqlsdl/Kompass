//
//  HangulEducationRecapView.swift
//  Orum
//
//  Created by Youngbin Choi on 10/31/23.
//

import SwiftUI

struct HangulEducationRecapView: View {
    
//    @Binding var content : HangulUnit
    
    @EnvironmentObject var educationManager: EducationManager
    
    @State var touchCardsCount : Int = 0

    @State var isOnceFlipped : [Bool] = [false,false,false,false,false,false,false,false,false,false] // TODO: HangulCardView
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
                            HangulCardView(hangulCard: educationManager.content[index], touchCardsCount: $touchCardsCount, isOnceFlipped: $isOnceFlipped, isFlipped: $isFlipped, lottieView: LottieView(fileName: educationManager.content[index].name), isLearningView: false)
                        }
                    }
                }
                .padding(.horizontal, 7)
                .padding(.bottom, 85)
            }
        }
    }
}

#Preview {
    HangulEducationRecapView()
        .environmentObject(EducationManager())
}
