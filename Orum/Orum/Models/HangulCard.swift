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
    var soundExample1 : String = ""
    var soundExample2 : String = ""
    var lottieName : String = ""
    
    init(name: String) {
        self.name = name
        
        if Constants.Hangul.consonants.contains(name) {
            self.sound = Constants.Hangul.consonantSound[name] ?? ""
            self.example1 = Constants.Hangul.consonantExamples[name]?[0] ?? ""
            self.example2 = Constants.Hangul.consonantExamples[name]?[1] ?? ""
            self.soundExample1 = Constants.Hangul.consonantExamples[name]?[0] ?? ""
            self.soundExample2 = Constants.Hangul.consonantExamples[name]?[1] ?? ""
            self.lottieName = Constants.Hangul.lottieName[name] ?? ""
        }
        
        else if Constants.Hangul.vowels.contains(name) {
            self.sound = Constants.Hangul.vowelSound[name] ?? ""
            self.lottieName = ""
        }
        
        else { // 받침
            self.sound = Constants.Hangul.consonantSound[name] ?? ""
        }
    }
}




extension HangulCard {
    static let preview = [
        HangulCard(name: "ㄱ"),
        HangulCard(name: "ㄴ"),
        HangulCard(name: "ㄷ"),
        HangulCard(name: "ㄹ")
    ]
}
