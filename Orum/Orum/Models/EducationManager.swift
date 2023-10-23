//
//  EducationManager.swift
//  Orum
//
//  Created by 차차 on 10/22/23.
//

import Foundation

class EducationManager: ObservableObject {
    @Published var educationProgress: Int
    @Published var nowStudying: String
    
    init() {
        educationProgress = 5
        nowStudying = "Consonants 1"
    }
}
