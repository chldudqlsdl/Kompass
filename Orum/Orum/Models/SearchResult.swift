//
//  SearchResult.swift
//  Orum
//
//  Created by 차차 on 10/31/23.
//

import Foundation

enum Level: String {
    case system = "System"
    case basic = "Basic"
    case advance = "Advance"
}

class SearchResult: ObservableObject {
    @Published var level: Level
    
    init() {
        level = .system
    }
}
