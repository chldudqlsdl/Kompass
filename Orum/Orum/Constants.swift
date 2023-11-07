//
//  Constants.swift
//  Orum
//
//  Created by 차차 on 11/5/23.
//

import Foundation

enum GroupName {
    case system, consonant, vowel
}

struct Constants {
    struct Chapter {

        static let chapters: [String] = [
            system,
            consonant1,
            consonant2,
            consonant3,
            consonant4,
            consonant5,
            vowel1,
            vowel2,
            vowel3
        ]
        
        static let chapterComponent: [[[String]]] = [
            [[]],
            [
                ["ㄱ","ㄴ","ㄷ","ㄹ"],
                ["ㅁ","ㅂ","ㅅ","ㅇ","ㅈ"],
                ["ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"],
                ["ㄲ","ㄸ","ㅃ","ㅆ","ㅉ"],
                []
            ],
            [
                ["ㅡ","ㅣ","ㅏ","ㅓ","ㅗ","ㅜ","ㅐ","ㅔ"],
                ["ㅑ","ㅕ","ㅛ","ㅠ","ㅒ","ㅖ"],
                ["ㅢ","ㅚ","ㅟ","ㅘ","ㅝ","ㅙ","ㅞ"],
            ]
        ]
        
        static let system: String = "System of Hangul"
        static let consonant1: String = "Consonant1"
        static let consonant2: String = "Consonant2"
        static let consonant3: String = "Consonant3"
        static let consonant4: String = "Consonant4"
        static let consonant5: String = "Consonant5"
        static let vowel1: String = "Vowel1"
        static let vowel2: String = "Vowel2"
        static let vowel3: String = "Vowel3"
    }
    
    struct Example {
        static let consonantExamples: [[String]] = [
            ["가","구"],
        ]
    }
}
