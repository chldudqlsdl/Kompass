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

let practiceWords: [String : [PracticeWord]] = [
    "Food" : [
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
        PracticeWord(word: "붕어빵"),
    ]
    ,
    "Tourism" : [
        PracticeWord(word: "홍대"),
        PracticeWord(word: "성수"),
        PracticeWord(word: "서울"),
        PracticeWord(word: "강남"),
        PracticeWord(word: "인천"),
        PracticeWord(word: "부산"),
        PracticeWord(word: "한강"),
        PracticeWord(word: "익선동"),
        PracticeWord(word: "이태원"),
        PracticeWord(word: "동대문"),
        PracticeWord(word: "혜화"),
        PracticeWord(word: "종로"),
        PracticeWord(word: "광장시장"),
        PracticeWord(word: "지하철"),
        PracticeWord(word: "버스"),
        PracticeWord(word: "가로수길"),
        PracticeWord(word: "공항"),
        PracticeWord(word: "경복궁"),
        PracticeWord(word: "남산"),
        PracticeWord(word: "명동"),
    ]
    ,
    "Daily Life" : [
        PracticeWord(word: "안녕하세요"),
        PracticeWord(word: "감사합니다"),
        PracticeWord(word: "죄송합니다"),
        PracticeWord(word: "맛있어요"),
        PracticeWord(word: "주세요"),
        PracticeWord(word: "어디에요"),
        PracticeWord(word: "얼마에요"),
        PracticeWord(word: "도와주세요"),
        PracticeWord(word: "편의점"),
        PracticeWord(word: "병원"),
        PracticeWord(word: "화장실"),
        PracticeWord(word: "좋아요"),
        PracticeWord(word: "싫어요"),
        PracticeWord(word: "네"),
        PracticeWord(word: "아니요"),
    ]
]
