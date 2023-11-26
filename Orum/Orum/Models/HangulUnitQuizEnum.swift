//
//  HangulUnitQuizEnum.swift
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
        HangulQuiz(lessonType: .lesson, name: "ㄱ"),
        HangulQuiz(lessonType: .lesson, name: "ㄴ"),
        HangulQuiz(lessonType: .lesson, name: "ㄷ"),
        HangulQuiz(lessonType: .lesson, name: "ㄹ"),
    ]
    
    static let consonant2 = [
        HangulQuiz(lessonType: .lesson, name: "ㅁ"),
        HangulQuiz(lessonType: .lesson, name: "ㅂ"),
        HangulQuiz(lessonType: .lesson, name: "ㅅ"),
        HangulQuiz(lessonType: .lesson, name: "ㅇ"),
        HangulQuiz(lessonType: .lesson, name: "ㅈ"),
    ]

    static let consonant3: [HangulQuiz] = [
        HangulQuiz(lessonType: .lesson, name: "ㅊ"),
        HangulQuiz(lessonType: .lesson, name: "ㅌ"),
        HangulQuiz(lessonType: .lesson, name: "ㅋ"),
        HangulQuiz(lessonType: .lesson, name: "ㅍ"),
        HangulQuiz(lessonType: .lesson, name: "ㅎ"),
    ]
    
    static let consonant4: [HangulQuiz] = [
        HangulQuiz(lessonType: .lesson, name: "ㄲ"),
        HangulQuiz(lessonType: .lesson, name: "ㄸ"),
        HangulQuiz(lessonType: .lesson, name: "ㅃ"),
        HangulQuiz(lessonType: .lesson, name: "ㅆ"),
        HangulQuiz(lessonType: .lesson, name: "ㅉ"),
        
    ]
    
    static let consonant5: [HangulQuiz] = [
        HangulQuiz(lessonType: .epilogue, name: "ㄱ"),
        HangulQuiz(lessonType: .epilogue, name: "ㄴ"),
        HangulQuiz(lessonType: .epilogue, name: "ㄷ"),
        HangulQuiz(lessonType: .epilogue, name: "ㄹ"),
        HangulQuiz(lessonType: .epilogue, name: "ㅁ"),
        HangulQuiz(lessonType: .epilogue, name: "ㅂ"),
        HangulQuiz(lessonType: .epilogue, name: "ㅅ"),
        HangulQuiz(lessonType: .epilogue, name: "ㅇ"),
        HangulQuiz(lessonType: .epilogue, name: "ㅈ"),
        HangulQuiz(lessonType: .epilogue, name: "ㅊ"),
        HangulQuiz(lessonType: .epilogue, name: "ㅌ"),
        HangulQuiz(lessonType: .epilogue, name: "ㅋ"),
        HangulQuiz(lessonType: .epilogue, name: "ㅍ"),
        HangulQuiz(lessonType: .epilogue, name: "ㅎ"),
        HangulQuiz(lessonType: .epilogue, name: "ㄲ"),
        HangulQuiz(lessonType: .epilogue, name: "ㄸ"),
        HangulQuiz(lessonType: .epilogue, name: "ㅃ"),
        HangulQuiz(lessonType: .epilogue, name: "ㅆ"),
        HangulQuiz(lessonType: .epilogue, name: "ㅉ"),
    ]
    
    static let vowel0: [HangulQuiz] = []

    
    static let vowel1: [HangulQuiz] = [
        HangulQuiz(lessonType: .lesson, name: "ㅡ"),
        HangulQuiz(lessonType: .lesson, name: "ㅣ"),
        HangulQuiz(lessonType: .lesson, name: "ㅏ"),
        HangulQuiz(lessonType: .lesson, name: "ㅓ"),
        HangulQuiz(lessonType: .lesson, name: "ㅗ"),
        HangulQuiz(lessonType: .lesson, name: "ㅜ"),
        HangulQuiz(lessonType: .lesson, name: "ㅐ"),
        HangulQuiz(lessonType: .lesson, name: "ㅔ"),
    ]
    
    static let vowel2: [HangulQuiz] = [
        HangulQuiz(lessonType: .lesson, name: "ㅑ"),
        HangulQuiz(lessonType: .lesson, name: "ㅕ"),
        HangulQuiz(lessonType: .lesson, name: "ㅛ"),
        HangulQuiz(lessonType: .lesson, name: "ㅠ"),
        HangulQuiz(lessonType: .lesson, name: "ㅒ"),
        HangulQuiz(lessonType: .lesson, name: "ㅖ"),
    ]
    
    static let vowel3: [HangulQuiz] = [
        HangulQuiz(lessonType: .lesson, name: "ㅢ"),
        HangulQuiz(lessonType: .lesson, name: "ㅟ"),
        HangulQuiz(lessonType: .lesson, name: "ㅚ"),
        HangulQuiz(lessonType: .lesson, name: "ㅘ"),
        HangulQuiz(lessonType: .lesson, name: "ㅝ"),
        HangulQuiz(lessonType: .lesson, name: "ㅙ"),
        HangulQuiz(lessonType: .lesson, name: "ㅞ"),
    ]
    
    static let vowel4: [HangulQuiz] = [
        HangulQuiz(lessonType: .epilogue, name: "ㅡ"),
        HangulQuiz(lessonType: .epilogue, name: "ㅣ"),
        HangulQuiz(lessonType: .epilogue, name: "ㅏ"),
        HangulQuiz(lessonType: .epilogue, name: "ㅓ"),
        HangulQuiz(lessonType: .epilogue, name: "ㅗ"),
        HangulQuiz(lessonType: .epilogue, name: "ㅜ"),
        HangulQuiz(lessonType: .epilogue, name: "ㅐ"),
        HangulQuiz(lessonType: .epilogue, name: "ㅔ"),
        HangulQuiz(lessonType: .epilogue, name: "ㅑ"),
        HangulQuiz(lessonType: .epilogue, name: "ㅕ"),
        HangulQuiz(lessonType: .epilogue, name: "ㅛ"),
        HangulQuiz(lessonType: .epilogue, name: "ㅠ"),
        HangulQuiz(lessonType: .epilogue, name: "ㅒ"),
        HangulQuiz(lessonType: .epilogue, name: "ㅖ"),
        HangulQuiz(lessonType: .epilogue, name: "ㅢ"),
        HangulQuiz(lessonType: .epilogue, name: "ㅟ"),
        HangulQuiz(lessonType: .epilogue, name: "ㅚ"),
        HangulQuiz(lessonType: .epilogue, name: "ㅘ"),
        HangulQuiz(lessonType: .epilogue, name: "ㅝ"),
        HangulQuiz(lessonType: .epilogue, name: "ㅙ"),
        HangulQuiz(lessonType: .epilogue, name: "ㅞ"),
    ]
    
    static let batchim0: [HangulQuiz] = []
    
    static let batchim1: [HangulQuiz] = []
    
    static let batchim2: [HangulQuiz] = []
    
    static let batchim3: [HangulQuiz] = []
    
    static let batchim4: [HangulQuiz] = []
}
