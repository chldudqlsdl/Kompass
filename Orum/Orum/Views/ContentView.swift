//
//  ContentView.swift
//  Orum
//
//  Created by 차차 on 11/15/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var educationManager: EducationManager = EducationManager()
    @StateObject var practiceManager: PracticeManager = PracticeManager()
    
    var body: some View {
            TabView {
                LearningView()
                    .environmentObject(educationManager)
                    .tabItem {
                        Label("Learn", systemImage: "book.fill")
                    }
                
                PracticeView()
                    .environmentObject(practiceManager)
                    .tabItem {
                        Label("Practice", systemImage: "highlighter")
                    }
                
                
                CollectionView()
                    .environmentObject(educationManager)
                    .tabItem {
                        Label("Collection", systemImage: "list.bullet.rectangle.portrait")
                    }
            }
    }
}

#Preview {
    ContentView()
}
