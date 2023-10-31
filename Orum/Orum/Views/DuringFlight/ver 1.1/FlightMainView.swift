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
                    Image(systemName: "book.fill")
                    Text("Learn")
                }
            
            GameView()
                .environmentObject(educationManager)
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Game")
                }
            
            SearchView()
                .environmentObject(educationManager)
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
