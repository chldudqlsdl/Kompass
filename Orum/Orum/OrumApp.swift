//
//  OrumApp.swift
//  Orum
//
//  Created by 차차 on 10/16/23.
//

import SwiftUI

@main
struct OrumApp: App {
    @AppStorage("isFirstLaunching") var isFirstLaunching: Bool = true
    
    var body: some Scene {
        WindowGroup {
            if isFirstLaunching {
                OnboardingView(isFirstLaunching: $isFirstLaunching)
            }
            else {
                ContentView()
            }
        }
    }
}
