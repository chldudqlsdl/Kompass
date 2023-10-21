//
//  CosonantCardView.swift
//  Orum
//
//  Created by Youngbin Choi on 10/20/23.
//

import SwiftUI

struct ConsonantCardView: View {
    
    @State var hangulUnit : HangulUnit
    @State var flipCheck : Bool = false
    @State var example1Check : Bool = false
    @State var example2Check : Bool = false

    
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color(uiColor: UIColor(hex: "F2F2F7")).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack{
                    ConsonantCardContentView(hangulUnit: $hangulUnit, flipCheck: $flipCheck, example1Check: $example1Check, example2Check: $example2Check)
                    Spacer()
                    Divider()
                        .padding(.vertical, 10)
                    HStack(spacing: 80){
                        ZStack{
                            Image(systemName: "arrow.uturn.backward")
                                .foregroundStyle(.blue)
                                .font(.system(size: 32.0))
                                .padding(10)
                        }
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20.0))
                        .shadow(radius: 3)
                        ZStack{
                            HStack{
                                Text("0/3")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundStyle(Color(UIColor(hex: "D1D1D6")))
                                Spacer()
                                Image(systemName: "speaker.wave.2.circle.fill")
                                    .font(.system(size: 32.0))
                                    .foregroundStyle(Color(UIColor(hex: "D1D1D6")))
                                Image(systemName: "speaker.wave.2.circle.fill")
                                    .font(.system(size: 32.0))
                                    .foregroundStyle(Color(UIColor(hex: "D1D1D6")))
                                Image(systemName: "speaker.wave.2.circle.fill")
                                    .font(.system(size: 32.0))
                                    .foregroundStyle(Color(UIColor(hex: "D1D1D6")))
                                
                            }
                            .padding(10)
                        }
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20.0))
                        .shadow(radius: 3)
                    }
                    .padding(.bottom, 20)
                   
                }
                .frame(width: UIScreen.main.bounds.size.width - 40)
            }
            .navigationTitle(hangulUnit.unitName.capitalized)
            
        }
    }
    
}

#Preview {
    ConsonantCardView(hangulUnit: HangulUnit(unitName: "consonants1", unitIndex: 0, hangulCards: [
        HangulCard(name: "ㄱ", sound: "g", example1: "가", example2: "구", soundExample1: "ga", soundExample2: "gu"),
        HangulCard(name: "ㄴ", sound: "n", example1: "나", example2: "누", soundExample1: "na", soundExample2: "nu"),
        HangulCard(name: "ㄷ", sound: "d", example1: "다", example2: "두", soundExample1: "da", soundExample2: "du"),
        HangulCard(name: "ㄹ", sound: "r", example1: "라", example2: "루", soundExample1: "ra", soundExample2: "ru")
    ]))
}
