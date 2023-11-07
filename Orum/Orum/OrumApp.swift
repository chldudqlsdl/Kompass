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
//            switch navigationManager.viewCycle {
//            case .first:
//                TripDateSettingView()
//                    .environmentObject(navigationManager)
//                    .transition(.slide)
//
//            case .second:
//                TripRemainingDayView()
//                    .environmentObject(navigationManager)
//                    .transition(.slide)
//
//            case .third:
//                FlightInfoSubmitView()
//                    .environmentObject(navigationManager)
//                    .transition(.slide)
//
//            case .fourth:
//                DepartRemainingTimeView()
//                    .environmentObject(navigationManager)
//                    .transition(.slide)
//
//
//            case .fifth:
//                HangulEducationMainView()
//                    .environmentObject(navigationManager)
//                    .transition(.slide)
//            }
            FlightMainView()
        }
    }
}
