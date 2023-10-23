//
//  EducationManager.swift
//  Orum
//
//  Created by 차차 on 10/22/23.
//

import Foundation

enum Units: String {
    case preview = "Preview"
    case consonants1 = "Consonants 1"
    case Consonants2 = "Consonants 2"
}

class EducationManager: ObservableObject {
    @Published var educationProgress: Int
    @Published var unit: Units
    @Published var studiedContents: [HangulCard]
    
    init() {
        educationProgress = 0
        unit = .consonants1
        studiedContents = []
    }
}
