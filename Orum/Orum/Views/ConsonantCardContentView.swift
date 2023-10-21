//
//  ConsonantCardContentView.swift
//  Orum
//
//  Created by Youngbin Choi on 10/20/23.
//

import SwiftUI

struct ConsonantCardContentView: View {
    
    @Binding var hangulUnit : HangulUnit
    @Binding var flipCheck : Bool
    @Binding var example1Check : Bool
    @Binding var example2Check : Bool
    @State private var flipped: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 40 ){
            ZStack{
                VStack{
                    Image(hangulUnit.hangulCards[hangulUnit.unitIndex].name)
                        .padding(.top, 50)
                    ZStack{
                        Text(hangulUnit.hangulCards[hangulUnit.unitIndex].sound)
                            .fontWeight(.bold)
                            .font(.largeTitle)
                        Text("[   ]")
                            .fontWeight(.bold)
                            .font(.largeTitle)
                            .foregroundStyle(Color(UIColor(hex: "D1D1D6")))
                    }
                    .padding(15)
                    Divider()
                    
                    Image(systemName: "lightbulb.circle.fill")
                        .font(.system(size: 32.0))
                        .foregroundStyle(.blue)
                        .padding(10)
                        .onTapGesture { flipped.toggle() }
                }
            }
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
//            .shadow(radius: 3)
            .rotation3DEffect(flipped ? Angle(degrees: 180) : .zero,
                              axis: (x: 0.0, y: 1.0, z: 0.0))
            .animation(.default, value: flipped)
            
            
            VStack(alignment: .leading, spacing: 10){
                Text("Pronunciation Example")
                    .fontWeight(.bold)
                    .font(.footnote)
                    .offset(x: 10)
                HStack(spacing: 20){
                    ZStack{
                        HStack{
                            Text(hangulUnit.hangulCards[hangulUnit.unitIndex].example1)
                                .font(.title2)
                                .fontWeight(.bold)
                            ZStack {
                                    Text(hangulUnit.hangulCards[hangulUnit.unitIndex].sound)
                                        .fontWeight(.bold)
                                        .font(.title2)
                                    +
                                    Text("a")
                                        .fontWeight(.bold)
                                        .font(.title2)
                                        .foregroundStyle(Color(UIColor(hex: "D1D1D6")))
                                Text("[      ]")
                                    .fontWeight(.bold)
                                    .font(.title2)
                                    .foregroundStyle(Color(UIColor(hex: "D1D1D6")))
                            }
                            Spacer()
                            Image(systemName: "speaker.wave.2.circle.fill")
                                .font(.system(size: 32.0))
                                .foregroundStyle(.blue)
//                                .onTapGesture {
//                                    TTSManager.shared.play(hangulUnit.hangulCards[hangulUnit.unitIndex].example1)
//                                }
                        }
                        .padding(10)
                    }
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
//                    .shadow(radius: 3)
                    ZStack{
                        HStack{
                            Text(hangulUnit.hangulCards[hangulUnit.unitIndex].example2)
                                .font(.title2)
                                .fontWeight(.bold)
                            ZStack {
                                Text(hangulUnit.hangulCards[hangulUnit.unitIndex].sound)
                                    .fontWeight(.bold)
                                    .font(.title2)
                                +
                                Text("u")
                                    .fontWeight(.bold)
                                    .font(.title2)
                                    .foregroundStyle(Color(UIColor(hex: "D1D1D6")))
                                Text("[      ]")
                                    .fontWeight(.bold)
                                    .font(.title2)
                                    .foregroundStyle(Color(UIColor(hex: "D1D1D6")))
                            }
                            Spacer()
                            Image(systemName: "speaker.wave.2.circle.fill")
                                .font(.system(size: 32.0))
                                .foregroundStyle(.blue)
//                                .onTapGesture {
//                                    TTSManager.shared.play(hangulUnit.hangulCards[hangulUnit.unitIndex].example2)
//                                }
                        }
                        .padding(10)
                    }
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
//                    .shadow(radius: 3)
                }
            }
        }
    }
}
#Preview {
    ConsonantCardContentView(hangulUnit: .constant(HangulUnit(unitName: "consonants1", unitIndex: 0, hangulCards: [
        HangulCard(name: "ㄱ", sound: "g", example1: "가", example2: "구", soundExample1: "ga", soundExample2: "gu"),
        HangulCard(name: "ㄴ", sound: "n", example1: "나", example2: "누", soundExample1: "na", soundExample2: "nu"),
        HangulCard(name: "ㄷ", sound: "d", example1: "다", example2: "두", soundExample1: "da", soundExample2: "du"),
        HangulCard(name: "ㄹ", sound: "r", example1: "라", example2: "루", soundExample1: "ra", soundExample2: "ru")
    ])), flipCheck: .constant(false), example1Check: .constant(false), example2Check: .constant(false))
}
