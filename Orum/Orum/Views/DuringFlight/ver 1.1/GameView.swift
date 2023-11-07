//
//  GameView.swift
//  Orum
//
//  Created by 차차 on 10/31/23.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        ZStack {
            NavigationView {
                    VStack {
                        Spacer()
                        
                        Divider()
                    }
//                    .navigationTitle("Game")
            }
            .blur(radius: 8)
            
            ScrollView {
                Text("Coming Soon ...")
                    .bold()
                    .font(.largeTitle)
                    .padding(.vertical, 350)
                
                Spacer()
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    GameView()
}
