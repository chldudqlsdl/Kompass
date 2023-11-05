//
//  FlightMainView.swift
//  Orum
//
//  Created by 차차 on 10/31/23.
//

import SwiftUI

struct FlightMainView: View {
    @StateObject var educationManager: EducationManager = EducationManager()
    
    var body: some View {
        TabView {
            LearnView()
                .environmentObject(educationManager)
                .tabItem {
                        Label("Learn", systemImage: "book.fill")
                }
            
            GameView()
                .environmentObject(educationManager)
                .tabItem {
                        Label("Game", systemImage: "gamecontroller")
                }

            
            SearchView()
                .environmentObject(educationManager)
                .tabItem {
                        Label("Search", systemImage: "list.bullet.rectangle.portrait")
                }
        }
    }
}

#Preview {
    FlightMainView()
}
