//
//  HnagulUnitQuizEnum.swift
//  Orum
//
//  Created by Youngbin Choi on 11/15/23.
//

import Foundation

struct HangulUnitQuizEnum: RawRepresentable { // 자모 분리를 통해서 ㄱ -> g & 가 -> ga, 구 -> gu 로 변환 되게 하기
    let rawValue: Int
    
    static let system: [HangulQuiz] = []
    
    static let consonant0: [HangulQuiz] = []
    
    static let consonant1: [HangulQuiz] = [
        HangulQuiz(name: "ㄱ"),
        HangulQuiz(name: "ㄴ"),
        HangulQuiz(name: "ㄷ"),
        HangulQuiz(name: "ㄹ"),
    ]
    
    static let consonant2 = [
        HangulQuiz(name: "ㅁ"),
        HangulQuiz(name: "ㅂ"),
        HangulQuiz(name: "ㅅ"),
        HangulQuiz(name: "ㅇ"),
        HangulQuiz(name: "ㅈ"),
    ]

    static let consonant3: [HangulQuiz] = [
        HangulQuiz(name: "ㅊ"),
        HangulQuiz(name: "ㅌ"),
        HangulQuiz(name: "ㅋ"),
        HangulQuiz(name: "ㅍ"),
        HangulQuiz(name: "ㅎ"),
    ]
    
    static let consonant4: [HangulQuiz] = [
        HangulQuiz(name: "ㄲ"),
        HangulQuiz(name: "ㄸ"),
        HangulQuiz(name: "ㅃ"),
        HangulQuiz(name: "ㅆ"),
        HangulQuiz(name: "ㅉ"),
        
    ]
    
    static let consonant5: [HangulQuiz] = []
    
    static let vowel0: [HangulQuiz] = []

    
    static let vowel1: [HangulQuiz] = [
        HangulQuiz(name: "ㅡ"),
        HangulQuiz(name: "ㅣ"),
        HangulQuiz(name: "ㅏ"),
        HangulQuiz(name: "ㅓ"),
        HangulQuiz(name: "ㅗ"),
        HangulQuiz(name: "ㅜ"),
        HangulQuiz(name: "ㅐ"),
        HangulQuiz(name: "ㅔ"),
    ]
    
    static let vowel2: [HangulQuiz] = [
        HangulQuiz(name: "ㅑ"),
        HangulQuiz(name: "ㅕ"),
        HangulQuiz(name: "ㅛ"),
        HangulQuiz(name: "ㅠ"),
        HangulQuiz(name: "ㅒ"),
        HangulQuiz(name: "ㅖ"),
    ]
    
    static let vowel3: [HangulQuiz] = [
        HangulQuiz(name: "ㅢ"),
        HangulQuiz(name: "ㅟ"),
        HangulQuiz(name: "ㅚ"),
        HangulQuiz(name: "ㅘ"),
        HangulQuiz(name: "ㅝ"),
        HangulQuiz(name: "ㅙ"),
        HangulQuiz(name: "ㅞ"),
    ]
    
    static let vowel4: [HangulQuiz] = []
    
    static let batchim0: [HangulQuiz] = []
    
    static let batchim1: [HangulQuiz] = []
    
    static let batchim2: [HangulQuiz] = []
    
    static let batchim3: [HangulQuiz] = []
}
