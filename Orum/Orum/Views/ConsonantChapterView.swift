//
//  ConsonantChapterView.swift
//  Orum
//
//  Created by Youngbin Choi on 10/22/23.
//

import SwiftUI

struct ConsonantChapterView: View {
    
    @State var hangulUnit : HangulUnit
    
    var body: some View {
        NavigationStack{
            ZStack {
                Color(uiColor: UIColor(hex: "F2F2F7")).edgesIgnoringSafeArea(.all)
                VStack{
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 15), GridItem(.flexible())], spacing: 15) {
                        ForEach(0..<hangulUnit.hangulCards.count, id: \.self) { index in
                            let hangulCard = hangulUnit.hangulCards[index]
                            ConsonantChapterContentView(hangulCard: hangulCard)
                        }
                    }
                    Spacer()
                    Divider()
                        .padding(.vertical, 10)
                    HStack{
                        ZStack{
                            Image(systemName: "arrow.uturn.backward")
                                .foregroundStyle(.blue)
                                .font(.system(size: 32.0))
                                .padding(10)
                        }
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 15.0))
//                        .shadow(radius: 3)
                        .onTapGesture {
                            print()
                        }
                        Spacer()
                        
                        ZStack{
                            HStack{
                                Image(systemName: "q.circle.fill")
                                    .font(.system(size: 32.0))
                                    .foregroundStyle(.white)
                                Text("Quiz")
                                    .fontWeight(.bold)
                                    .font(.system(size: 17))
                                    .foregroundStyle(.white)
                            }
                            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        }
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 12.0))
//                        .shadow(radius: 3)
                        .onTapGesture {
                            print()
                        }
                    }
                    .padding(.bottom, 20)
                    
                }
                .frame(width: UIScreen.main.bounds.size.width - 30)
//                .padding(.horizontal, 15)
            }
            .navigationTitle(hangulUnit.unitName.capitalized)
            .navigationBarTitleDisplayMode(.large)
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    ConsonantChapterView(hangulUnit: HangulUnit(unitName: "consonants1", unitIndex: 0, hangulCards: [
        HangulCard(name: "ㄱ", sound: "g", example1: "가", example2: "구", soundExample1: "ga", soundExample2: "gu"),
        HangulCard(name: "ㄴ", sound: "n", example1: "나", example2: "누", soundExample1: "na", soundExample2: "nu"),
        HangulCard(name: "ㄷ", sound: "d", example1: "다", example2: "두", soundExample1: "da", soundExample2: "du"),
        HangulCard(name: "ㄹ", sound: "r", example1: "라", example2: "루", soundExample1: "ra", soundExample2: "ru")
    ]))
}
