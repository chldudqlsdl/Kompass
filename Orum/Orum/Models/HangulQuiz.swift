//
//  HangulQuiz.swift
//  Orum
//
//  Created by Youngbin Choi on 11/15/23.
//

import Foundation

struct HangulQuiz {
    let lessonType : LessonType
    let name : String
    let sound : String
    let quizName : String
    let options : [String]
    let meaning : String
    let tmi : String
    
    init(lessonType: LessonType, name: String) {
        let quizName  = Constants.Hangul.consonantQuiz[name]?[0]
        
        if Constants.Hangul.consonants.contains(name) {
            self.lessonType = lessonType
            self.name = name
            self.sound = Constants.Hangul.consonantSound[name] ?? ""
            self.quizName = Constants.Hangul.consonantQuiz[name]?[lessonType == .lesson ? 0 : 1] ?? ""
            self.options = Constants.HangulQuiz.options[quizName ?? ""] ?? [""]
            self.meaning = Constants.HangulQuiz.meaning[quizName ?? ""] ?? ""
            self.tmi = Constants.HangulQuiz.tmi[quizName ?? ""] ?? ""
        }
        else if Constants.Hangul.vowels.contains(name) {
            self.lessonType = lessonType
            self.name = name
            self.sound = Constants.Hangul.vowelSound[name] ?? ""
            self.quizName = Constants.Hangul.consonantQuiz[name]?[lessonType == .lesson ? 0 : 1] ?? ""
            self.options = Constants.HangulQuiz.options[quizName ?? ""] ?? [""]
            self.meaning = Constants.HangulQuiz.meaning[quizName ?? ""] ?? ""
            self.tmi = Constants.HangulQuiz.tmi[quizName ?? ""] ?? ""
        }
        else {
            self.lessonType = lessonType
            self.name = name
            self.sound = Constants.Hangul.consonantSound[name] ?? ""
            self.quizName = Constants.Hangul.consonantQuiz[name]?[lessonType == .lesson ? 0 : 1] ?? ""
            self.options = Constants.HangulQuiz.options[quizName ?? ""] ?? [""]
            self.meaning = Constants.HangulQuiz.meaning[quizName ?? ""] ?? ""
            self.tmi = Constants.HangulQuiz.tmi[quizName ?? ""] ?? ""
        }

    }
}
