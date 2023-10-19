//
//  OrumApp.swift
//  Orum
//
//  Created by 차차 on 10/16/23.
//

import SwiftUI

@main
struct OrumApp: App {
    @StateObject private var navigationManager = NavigationManager()
    var body: some Scene {
        WindowGroup {
            switch navigationManager.viewCycle {
            case .first:
                TripDateSettingView()
                    .environmentObject(navigationManager)
            case .second:
                TripRemainingDayView()
                    .environmentObject(navigationManager)
            case .third:
                FlightInfoSubmitView()
                    .environmentObject(navigationManager)
            case .fourth:
                DepartRemainingTimeView()
                    .environmentObject(navigationManager)
            }
        }
    }
}
