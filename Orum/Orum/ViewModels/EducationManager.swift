//
//  EducationManager.swift
//  Orum
//
//  Created by 차차 on 10/22/23.
//

import Foundation

enum Chapters {
    case consonant1, consonant2, consonant3
}

class EducationManager: ObservableObject {
    @Published var educationProgress: Int
    @Published var chapter: Chapters
    @Published var content: HangulUnit
    
    init() {
        educationProgress = 0
        chapter = .consonant1
        content = HangulUnit(unitName: "", unitIndex: 1, hangulCards: [])
    }
    
    func createContent() {
        content = HangulUnit(unitName: "Consonants1", unitIndex: 0, hangulCards: [
            HangulCard(name: "ㄱ", sound: "g", example1: "가", example2: "구", soundExample1: "ga", soundExample2: "gu", quiz: "가든", lottieName: "gun"),
            HangulCard(name: "ㄴ", sound: "n", example1: "나", example2: "누", soundExample1: "na", soundExample2: "nu", quiz: "나노", lottieName: "nose"),
            HangulCard(name: "ㄷ", sound: "d", example1: "다", example2: "두", soundExample1: "da", soundExample2: "du", quiz: "다트", lottieName: "drink"),
            HangulCard(name: "ㄹ", sound: "r", example1: "라", example2: "루", soundExample1: "ra", soundExample2: "ru", quiz: "라디오", lottieName: "road")
        ])
    }
}
