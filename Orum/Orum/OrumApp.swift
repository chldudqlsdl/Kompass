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
//            ConsonantCardView(hangulUnit: HangulUnit(unitName: "consonants1", unitIndex: 0, hangulCards: [
//                HangulCard(name: "ㄱ", sound: "g", example1: "가", example2: "구", soundExample1: "ga", soundExample2: "gu"),
//                HangulCard(name: "ㄴ", sound: "n", example1: "나", example2: "누", soundExample1: "na", soundExample2: "nu"),
//                HangulCard(name: "ㄷ", sound: "d", example1: "다", example2: "두", soundExample1: "da", soundExample2: "du"),
//                HangulCard(name: "ㄹ", sound: "r", example1: "라", example2: "루", soundExample1: "ra", soundExample2: "ru")
//            ]))
        }
    }
}
