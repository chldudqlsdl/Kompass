//
//  ContentView.swift
//  Orum
//
//  Created by 차차 on 11/15/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var educationManager: EducationManager = EducationManager()
    
    var body: some View {
        ZStack {
            TabView {
                LearningView()
                    .environmentObject(educationManager)
                    .tabItem {
                        Label("Learn", systemImage: "book.fill")
                    }
                
                PracticeView()
                    .environmentObject(educationManager)
                    .tabItem {
                        Label("Practice", systemImage: "highlighter")
                    }
                
                
                CollectionView()
                    .environmentObject(educationManager)
                    .tabItem {
                        Label("Collection", systemImage: "list.bullet.rectangle.portrait")
                    }
            }
            /*
            VStack {
                Spacer()
                
                HStack {
                    RoundedRectangle(cornerRadius: 4)
                        .frame(width: 50, height: 30)
                        .padding(8)
                    
                    Text("ㄱㄴㄷㄹ")
                    
                    Spacer()
                    
                    Image(systemName: "play.fill")
                        .padding(.trailing, 8)
                }
                .background(RoundedRectangle(cornerRadius: 4)
                    .foregroundStyle(.white))
                .padding(.horizontal, 16)
                .padding(.bottom, UITabBarController().height)
            }
            */
        }
    }
}

/*
extension UITabBarController {
    var height: CGFloat {
        return self.tabBar.frame.size.height
    }
    
    var width: CGFloat {
        return self.tabBar.frame.size.width
    }
}
*/

#Preview {
    ContentView()
}
