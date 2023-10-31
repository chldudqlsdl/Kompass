//
//  FlightMainView.swift
//  Orum
//
//  Created by 차차 on 10/31/23.
//

import SwiftUI

struct FlightMainView: View {
    @StateObject var flightManager: FlightManager = FlightManager()
    
    var body: some View {
        TabView {
            LearnView()
                .environmentObject(flightManager)
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("Learn")
                }
            
            GameView()
                .environmentObject(flightManager)
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Game")
                }
            
            SearchView()
                .environmentObject(flightManager)
                .tabItem {
                    Image(systemName: "list.bullet.rectangle.portrait")
                    Text("Search")
                }
        }
    }
}

#Preview {
    FlightMainView()
}
