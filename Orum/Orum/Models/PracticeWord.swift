//
//  PracticeWord.swift
//  Orum
//
//  Created by Youngbin Choi on 11/21/23.
//

import Foundation

struct PracticeWord: Identifiable, Equatable {
    
    let id = UUID().uuidString
    let name: String
    let image: String
    let explanation: String
    
    init(word: String) {
        self.name = word
        self.image = word
        self.explanation = Constants.Practice.explanation[word] ?? ""
    }
}

let foods: [PracticeWord] = [
    PracticeWord(word: "국밥"),
    PracticeWord(word: "치맥"),
    PracticeWord(word: "삼겹살"),
    PracticeWord(word: "불고기"),
]

let practiceWords: [String : [PracticeWord]] = [
    "음식" : [
        PracticeWord(word: "국밥"),
        PracticeWord(word: "치맥"),
        PracticeWord(word: "삼겹살"),
        PracticeWord(word: "불고기"),
        PracticeWord(word: "삼계탕"),
        PracticeWord(word: "칼국수"),
        PracticeWord(word: "닭한마리"),
        PracticeWord(word: "라면"),
        PracticeWord(word: "불닭볶음면"),
        PracticeWord(word: "삼각김밥"),
        PracticeWord(word: "김치"),
        PracticeWord(word: "육회"),
        PracticeWord(word: "떡볶이"),
        PracticeWord(word: "소주"),
        PracticeWord(word: "빈대떡"),
        PracticeWord(word: "냉면"),
        PracticeWord(word: "비빔밥"),
        PracticeWord(word: "토스트"),
        PracticeWord(word: "붕어빵"),
    ]
]
