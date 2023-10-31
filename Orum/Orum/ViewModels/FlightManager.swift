//
//  FlightManager.swift
//  Orum
//
//  Created by 차차 on 10/31/23.
//

import Foundation

class FlightManager: ObservableObject {
    @Published var remainingTime: Int

    init() {
        remainingTime = 0
    }
}
