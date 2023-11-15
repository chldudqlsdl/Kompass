//
//  HangulQuiz.swift
//  Orum
//
//  Created by Youngbin Choi on 11/15/23.
//

import Foundation

struct HangulQuiz {
    let name : String
    let sound : String
    let quizName : String
    let options : [String]
    let meaning : String
    let tmi : String
    
    init(name: String) {
        let quizName  = Constants.Hangul.consonantQuiz[name]?[0]
        
        if Constants.Hangul.consonants.contains(name) {
            self.name = name
            self.sound = Constants.Hangul.consonantSound[name] ?? ""
            self.quizName = Constants.Hangul.consonantQuiz[name]?[0] ?? ""
            self.options = Constants.HangulQuiz.options[quizName ?? ""] ?? [""]
            self.meaning = Constants.HangulQuiz.meaning[quizName ?? ""] ?? ""
            self.tmi = Constants.HangulQuiz.tmi[quizName ?? ""] ?? ""
        }
        else if Constants.Hangul.vowels.contains(name) {
            self.name = name
            self.sound = Constants.Hangul.vowelSound[name] ?? ""
            self.quizName = Constants.Hangul.consonantQuiz[name]?[0] ?? ""
            self.options = Constants.HangulQuiz.options[quizName ?? ""] ?? [""]
            self.meaning = Constants.HangulQuiz.meaning[quizName ?? ""] ?? ""
            self.tmi = Constants.HangulQuiz.tmi[quizName ?? ""] ?? ""
        }
        else {
            self.name = name
            self.sound = Constants.Hangul.consonantSound[name] ?? ""
            self.quizName = Constants.Hangul.consonantQuiz[name]?[0] ?? ""
            self.options = Constants.HangulQuiz.options[quizName ?? ""] ?? [""]
            self.meaning = Constants.HangulQuiz.meaning[quizName ?? ""] ?? ""
            self.tmi = Constants.HangulQuiz.tmi[quizName ?? ""] ?? ""
        }

    }
}
