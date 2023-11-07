//
//  HangulUnitEnum.swift
//  Orum
//
//  Created by 차차 on 11/5/23.
//

import Foundation

let consonantExample: [[String]] = [
    ["가", "구"],
    ["나", "누"],
    ["다", "두"],
    ["라", "루"],
    ["마", "무"],
    ["바", "부"],
    ["사", "수"],
    ["아", "우"],
    ["자", "주"],
    ["차", "추"],
    ["카", "쿠"],
    ["타", "투"],
    ["파", "푸"],
    ["하", "후"],
]

let consonantQuizWord: [String] = [
    "가든",
    "나노",
    "다트",
    "라디오",
]

struct HangulUnitEnum: RawRepresentable { // 자모 분리를 통해서 ㄱ -> g & 가 -> ga, 구 -> gu 로 변환 되게 하기
    let rawValue: Int
    
    static let system: HangulUnit = HangulUnit(unitName: Constants.Chapter.system)
    
    static let consonant1: HangulUnit = HangulUnit(unitName: Constants.Chapter.consonant1, hangulCards: [
        HangulCard(name: "ㄱ", sound: "g", example1: "가", example2: "구", soundExample1: "ga", soundExample2: "gu", quiz: "가든", lottieName: "gun"),
        HangulCard(name: "ㄴ", sound: "n", example1: "나", example2: "누", soundExample1: "na", soundExample2: "nu", quiz: "나노", lottieName: "nose"),
        HangulCard(name: "ㄷ", sound: "d", example1: "다", example2: "두", soundExample1: "da", soundExample2: "du", quiz: "다트", lottieName: "drink"),
        HangulCard(name: "ㄹ", sound: "r", example1: "라", example2: "루", soundExample1: "ra", soundExample2: "ru", quiz: "라디오", lottieName: "road")
    ])
    
    static let consonant2: HangulUnit = HangulUnit(unitName: Constants.Chapter.consonant2, hangulCards: [
        HangulCard(name: "ㅁ", sound: "m", example1: "가", example2: "구", soundExample1: "ga", soundExample2: "gu", quiz: "", lottieName: "gun"),
        HangulCard(name: "ㅂ", sound: "b", example1: "나", example2: "누", soundExample1: "na", soundExample2: "nu", quiz: "", lottieName: "nose"),
        HangulCard(name: "ㅅ", sound: "s", example1: "다", example2: "두", soundExample1: "da", soundExample2: "du", quiz: "", lottieName: "drink"),
        HangulCard(name: "ㅇ", sound: " ", example1: "라", example2: "루", soundExample1: "ra", soundExample2: "ru", quiz: "", lottieName: "road"),
        HangulCard(name: "ㅈ", sound: "j", example1: "라", example2: "루", soundExample1: "ra", soundExample2: "ru", quiz: "", lottieName: "road")
    ])
    
    static let consonant3: HangulUnit = HangulUnit(unitName: Constants.Chapter.consonant3, hangulCards: [
        HangulCard(name: "ㅊ", sound: "c", example1: "가", example2: "구", soundExample1: "ga", soundExample2: "gu", quiz: "", lottieName: "gun"), // ch -> c
        HangulCard(name: "ㅋ", sound: "k", example1: "나", example2: "누", soundExample1: "na", soundExample2: "nu", quiz: "", lottieName: "nose"),
        HangulCard(name: "ㅌ", sound: "t", example1: "다", example2: "두", soundExample1: "da", soundExample2: "du", quiz: "", lottieName: "drink"),
        HangulCard(name: "ㅍ", sound: "p", example1: "라", example2: "루", soundExample1: "ra", soundExample2: "ru", quiz: "", lottieName: "road"),
        HangulCard(name: "ㅎ", sound: "h", example1: "라", example2: "루", soundExample1: "ra", soundExample2: "ru", quiz: "", lottieName: "road")
    ])
    
    static let consonant4: HangulUnit = HangulUnit(unitName: Constants.Chapter.consonant4, hangulCards: [
        HangulCard(name: "ㄲ", sound: "gg", example1: "가", example2: "구", soundExample1: "ga", soundExample2: "gu", quiz: "", lottieName: "gun"),
        HangulCard(name: "ㄸ", sound: "dd", example1: "나", example2: "누", soundExample1: "na", soundExample2: "nu", quiz: "", lottieName: "nose"),
        HangulCard(name: "ㅃ", sound: "bb", example1: "다", example2: "두", soundExample1: "da", soundExample2: "du", quiz: "", lottieName: "drink"),
        HangulCard(name: "ㅆ", sound: "ss", example1: "라", example2: "루", soundExample1: "ra", soundExample2: "ru", quiz: "", lottieName: "road"),
        HangulCard(name: "ㅉ", sound: "jj", example1: "라", example2: "루", soundExample1: "ra", soundExample2: "ru", quiz: "", lottieName: "road")
    ])
    
    static let consonant5: HangulUnit = HangulUnit(unitName: Constants.Chapter.consonant5)
    
    static let vowel1: HangulUnit = HangulUnit(unitName: Constants.Chapter.vowel1)
    
    static let vowel2: HangulUnit = HangulUnit(unitName: Constants.Chapter.vowel2)
    
    static let vowel3: HangulUnit = HangulUnit(unitName: Constants.Chapter.vowel3)
}
