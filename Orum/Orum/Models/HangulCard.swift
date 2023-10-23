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
    let example1 : String
    let example2 : String
    let soundExample1 : String
    let soundExample2 : String
    let quiz : String
}


//extension HangulCard {
//    static let consonant1 = [
//        HangulCard(name: "ㄱ", sound: "g", example1: "가", example2: "구", soundExample1: "ga", soundExample2: "gu"),
//        HangulCard(name: "ㄴ", sound: "n", example1: "나", example2: "누", soundExample1: "na", soundExample2: "nu"),
//        HangulCard(name: "ㄷ", sound: "d", example1: "다", example2: "두", soundExample1: "da", soundExample2: "du"),
//        HangulCard(name: "ㄹ", sound: "r", example1: "라", example2: "루", soundExample1: "ra", soundExample2: "ru")
//    ]
//}
