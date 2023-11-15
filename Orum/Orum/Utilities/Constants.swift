//
//  Constants.swift
//  Orum
//
//  Created by 차차 on 11/5/23.
//

import Foundation

struct Constants {
    struct Lesson {
        static let system: String = "System of Hangul"
        
        static let consonant0: String = "Consonant 0" // Consonant Prologue
        static let consonant1: String = "Consonant 1" // ㄱ,ㄴ,ㄷ,ㄹ
        static let consonant2: String = "Consonant 2" // ㅁ,ㅂ,ㅅ,ㅇ,ㅈ
        static let consonant3: String = "Consonant 3" // ㅊ,ㅋ,ㅌ,ㅍ,ㅎ
        static let consonant4: String = "Consonant 4" // ㄲ,ㄸ,ㅃ,ㅆ,ㅉ
        static let consonant5: String = "Consonant 5" // Consonant Quiz
        
        static let vowel0: String = "Vowel 0" // Vowel Prologue
        static let vowel1: String = "Vowel 1" // ㅡ,ㅣ : ㅏ,ㅓ,ㅗ,ㅜ : ㅐ,ㅔ
        static let vowel2: String = "Vowel 2" // ㅑ,ㅕ,ㅛ,ㅠ,ㅒ,ㅖ
        static let vowel3: String = "Vowel 3" // ㅢ,ㅟ,ㅚ,ㅘ,ㅝ,ㅙ,ㅞ
        static let vowel4: String = "Vowel 4" // Vowel Quiz
        
        static let batchim0: String = "Batchim 0" // Batchim Prologue
        static let batchim1: String = "Batchim 1" // ㄱ,ㄴ,ㄷ,ㄹ,ㅁ,ㅂ,ㅇ | ㅅ,ㅈ,ㅊ,ㅋ,ㅌ,ㅍ,ㄲ,ㅆ
        static let batchim2: String = "Batchim 2" // ㅎ | 겹받침
        static let batchim3: String = "Batchim 3" // Batchim Quiz

        
        static let lessons: [String] = [
            system, // 0
            consonant0, // 1
            consonant1, // 2
            consonant2, // 3
            consonant3, // 4
            consonant4, // 5
            consonant5, // 6
            vowel0, // 7
            vowel1, // 8
            vowel2, // 9
            vowel3, // 10
            vowel4, // 11
            batchim0, // 12
            batchim1, // 13
            batchim2, // 14
            batchim3, // 15
        ]
        
        static let lessonComponent: [[[String]]] = [
            [[]],
            [
                ["Prologue"],
                ["ㄱ","ㄴ","ㄷ","ㄹ"],
                ["ㅁ","ㅂ","ㅅ","ㅇ","ㅈ"],
                ["ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"],
                ["ㄲ","ㄸ","ㅃ","ㅆ","ㅉ"],
                ["Consonant Quiz"]
            ],
            [
                ["Prologue"],
                ["ㅡ","ㅣ","ㅏ","ㅓ","ㅗ","ㅜ","ㅐ","ㅔ"],
                ["ㅑ","ㅕ","ㅛ","ㅠ","ㅒ","ㅖ"],
                ["ㅢ","ㅚ","ㅟ","ㅘ","ㅝ","ㅙ","ㅞ"],
                ["Vowel Quiz"]
            ],
            [
                ["Prologue"],
                ["Basic"],
                ["Advanced"],
                ["Batchim Quiz"]
            ]
        ]
    }
    
    struct Hangul {
        static let consonants: [String] = [
            "ㄱ",
            "ㄴ",
            "ㄷ",
            "ㄹ",
            "ㅁ",
            "ㅂ",
            "ㅅ",
            "ㅇ",
            "ㅈ",
            "ㅊ",
            "ㅋ",
            "ㅌ",
            "ㅍ",
            "ㅎ",
            "ㄲ",
            "ㄸ",
            "ㅃ",
            "ㅆ",
            "ㅉ"
        ]
        
        static let consonantExamples: [String : [String]] = [
            "ㄱ" : ["가","구"],
            "ㄴ" : ["나","누"],
            "ㄷ" : ["다","두"],
            "ㄹ" : ["라","루"],
            "ㅁ" : ["마","무"],
            "ㅂ" : ["바","부"],
            "ㅅ" : ["사","수"],
            "ㅇ" : ["아","우"],
            "ㅈ" : ["자","주"],
            "ㅊ" : ["차","추"],
            "ㅋ" : ["카","쿠"],
            "ㅌ" : ["타","투"],
            "ㅍ" : ["파","푸"],
            "ㅎ" : ["하","후"],
            "ㄲ" : ["까", "꾸"],
            "ㄸ" : ["따", "뚜"],
            "ㅃ" : ["빠", "뿌"],
            "ㅆ" : ["싸", "쑤"],
            "ㅉ" : ["짜", "쭈"],
        ]
        
        static let consonantQuiz : [String : String] = [
            "ㄱ" : "가든",
            "ㄴ" : "나노",
            "ㄷ" : "다트",
            "ㄹ" : "라디오",
            "ㅁ" : "",
            "ㅂ" : "",
            "ㅅ" : "",
            "ㅇ" : "",
            "ㅈ" : "",
            "ㅊ" : "",
            "ㅋ" : "",
            "ㅌ" : "",
            "ㅍ" : "",
            "ㅎ" : "",
            "ㄲ" : "",
            "ㄸ" : "",
            "ㅃ" : "",
            "ㅆ" : "",
            "ㅉ" : "",
        ]
        
        static let consonantSound : [String : String] = [
            "ㄱ" : "g",
            "ㄴ" : "n",
            "ㄷ" : "d",
            "ㄹ" : "r",
            "ㅁ" : "m",
            "ㅂ" : "b",
            "ㅅ" : "s",
            "ㅇ" : " ",
            "ㅈ" : "j",
            "ㅊ" : "ch",
            "ㅋ" : "k",
            "ㅌ" : "t",
            "ㅍ" : "p",
            "ㅎ" : "h",
            "ㄲ" : "gg",
            "ㄸ" : "tt",
            "ㅃ" : "bb",
            "ㅆ" : "ss",
            "ㅉ" : "jj",
        ]
        
        static let consonantExamplesSound: [String : [String]] = [
            "ㄱ" : ["ga","gu"],
            "ㄴ" : ["na","nu"],
            "ㄷ" : ["da","du"],
            "ㄹ" : ["ra","ru"],
            "ㅁ" : ["ma","mu"],
            "ㅂ" : ["ba","bu"],
            "ㅅ" : ["sa","su"],
            "ㅇ" : [" a"," u"],
            "ㅈ" : ["ja","ju"],
            "ㅊ" : ["cha","chu"],
            "ㅋ" : ["ka","ku"],
            "ㅌ" : ["ta","tu"],
            "ㅍ" : ["pa","pu"],
            "ㅎ" : ["ha","hu"],
            "ㄲ" : ["gga", "ggu"],
            "ㄸ" : ["tta", "ttu"],
            "ㅃ" : ["bba", "bbu"],
            "ㅆ" : ["ssa", "ssu"],
            "ㅉ" : ["jja", "jju"],
        ]
        
        static let lottieName : [String: String] = [
            "ㄱ" : "gun",
            "ㄴ" : "nose",
            "ㄷ" : "drink",
            "ㄹ" : "road",
            "ㅁ" : "mouth",
            "ㅂ" : "bucket",
            "ㅅ" : "squid",
            "ㅇ" : "nothing",
            "ㅈ" : "",
            "ㅊ" : "",
            "ㅋ" : "key",
            "ㅌ" : "tooth",
            "ㅍ" : "pillar",
            "ㅎ" : "hat",
        ]
        
        static let vowels: [String] = [
            "ㅡ",
            "ㅣ",
            "ㅏ",
            "ㅓ",
            "ㅗ",
            "ㅜ",
            "ㅐ",
            "ㅔ",
            "ㅑ",
            "ㅕ",
            "ㅛ",
            "ㅠ",
            "ㅒ",
            "ㅖ",
            "ㅢ",
            "ㅟ",
            "ㅚ",
            "ㅘ",
            "ㅝ",
            "ㅙ",
            "ㅞ",
        ]
        
        static let vowelSound : [String : String] = [
            "ㅡ" : "eu",
            "ㅣ" : "i",
            "ㅏ" : "a",
            "ㅓ" : "eo",
            "ㅗ" : "o",
            "ㅜ" : "u",
            "ㅐ" : "ae",
            "ㅔ" : "ae",
            "ㅑ" : "ya",
            "ㅕ" : "yeo",
            "ㅛ" : "yo",
            "ㅠ" : "yu",
            "ㅒ" : "yae",
            "ㅖ" : "yae",
            "ㅢ" : "eui",
            "ㅟ" : "wui",
            "ㅚ" : "wea",
            "ㅘ" : "wa",
            "ㅝ" : "wue",
            "ㅙ" : "wea",
            "ㅞ" : "wea",
        ]
        
        static let vowelQuiz: [String : String] = [
            "ㅡ" : "",
            "ㅣ" : "",
            "ㅏ" : "",
            "ㅓ" : "",
            "ㅗ" : "",
            "ㅜ" : "",
            "ㅐ" : "",
            "ㅔ" : "",
            "ㅑ" : "",
            "ㅕ" : "",
            "ㅛ" : "",
            "ㅠ" : "",
            "ㅒ" : "",
            "ㅖ" : "",
            "ㅢ" : "",
            "ㅟ" : "",
            "ㅚ" : "",
            "ㅘ" : "",
            "ㅝ" : "",
            "ㅙ" : "",
            "ㅞ" : "",
        ]
    }
}
