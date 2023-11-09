//
//  HangulCard.swift
//  Orum
//
//  Created by Youngbin Choi on 10/20/23.
//

import Foundation

struct HangulCard: Hashable {
    let name : String
    let sound : String
    var example1 : String = ""
    var example2 : String = ""
    let soundExample1 : String
    let soundExample2 : String
    let quiz : String
    var lottieName : String
}


extension HangulCard {
    static let preview = [
        HangulCard(name: "ㄱ", sound: "g", example1: "가", example2: "구", soundExample1: "ga", soundExample2: "gu", quiz: "가든", lottieName: "gun"),
        HangulCard(name: "ㄴ", sound: "n", example1: "나", example2: "누", soundExample1: "na", soundExample2: "nu", quiz: "나노", lottieName: "nose"),
        HangulCard(name: "ㄷ", sound: "d", example1: "다", example2: "두", soundExample1: "da", soundExample2: "du", quiz: "다트", lottieName: "drink"),
        HangulCard(name: "ㄹ", sound: "r", example1: "라", example2: "루", soundExample1: "ra", soundExample2: "ru", quiz: "라디오", lottieName: "road")
    ]
}
