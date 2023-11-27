//
//  OrumApp.swift
//  Orum
//
//  Created by 차차 on 10/16/23.
//

import SwiftUI

@main
struct OrumApp: App {
    @StateObject var educationManager: EducationManager = EducationManager()
    @AppStorage("isFirstLaunching") var isFirstLaunching: Bool = true
    @State var isPresented : Bool = false
    
    var body: some Scene {
        WindowGroup {
            if isFirstLaunching {
                PrologueLessonView(isFirstLaunching: $isFirstLaunching, isPresented: $isFirstLaunching)
                    .environmentObject(educationManager)
                    .transition(.asymmetric(insertion: .opacity, removal: .move(edge: .leading)))
            }
            else {
                ContentView()
                    .transition(.slide)
            }
        }
    }
}
