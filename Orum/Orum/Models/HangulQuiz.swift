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
        if Constants.Hangul.consonants.contains(name) {
            let quizName  = Constants.Hangul.consonantQuiz[name]?[lessonType == .lesson ? 0 : 1] ?? ""

            self.lessonType = lessonType
            self.name = name
            self.sound = Constants.Hangul.consonantSound[name] ?? ""
            self.quizName = Constants.Hangul.consonantQuiz[name]?[lessonType == .lesson ? 0 : 1] ?? ""
            self.options = Constants.HangulQuiz.options[quizName] ?? [""]
            self.meaning = Constants.HangulQuiz.meaning[quizName] ?? ""
            self.tmi = Constants.HangulQuiz.tmi[quizName] ?? ""
        }
        else if Constants.Hangul.vowels.contains(name) {
            let quizName  = Constants.Hangul.vowelQuiz[name]?[lessonType == .lesson ? 0 : 1] ?? ""

            self.lessonType = lessonType
            self.name = name
            self.sound = Constants.Hangul.vowelSound[name] ?? ""
            self.quizName = Constants.Hangul.vowelQuiz[name]?[lessonType == .lesson ? 0 : 1] ?? ""
            self.options = Constants.HangulQuiz.options[quizName] ?? [""]
            self.meaning = Constants.HangulQuiz.meaning[quizName] ?? ""
            self.tmi = Constants.HangulQuiz.tmi[quizName] ?? ""
        }
        else {
            let quizName  = Constants.Hangul.consonantQuiz[name]?[0]

            self.lessonType = lessonType
            self.name = name
            self.sound = Constants.Hangul.consonantSound[name] ?? "" // change to batchim sound ... ?
            self.quizName = Constants.Hangul.consonantQuiz[name]?[lessonType == .lesson ? 0 : 1] ?? "" // change to batchim quiz
            self.options = Constants.HangulQuiz.options[quizName ?? ""] ?? [""]
            self.meaning = Constants.HangulQuiz.meaning[quizName ?? ""] ?? ""
            self.tmi = Constants.HangulQuiz.tmi[quizName ?? ""] ?? ""
        }
    }
}
