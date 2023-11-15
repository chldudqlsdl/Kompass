//
//  EducationManager.swift
//  Orum
//
//  Created by 차차 on 10/22/23.
//

import SwiftUI

enum ChapterState: String{
    case locked = "locked"
    case currentSession = "currentSession"
    case complete = "complete"
}

enum ChapterType {
    case system, consonant, vowel, batchim
}

enum lessonType {
    case prologue, lesson, quiz
}

class EducationManager: ObservableObject {
    @AppStorage("completedDate") var completedDates: [String:String] = [
        Constants.Chapter.system: "2023.11.04 16:23",
        Constants.Chapter.vowel1: ""
    ]
    @AppStorage("chapterState") var chapterState: [String:String] = [
        Constants.Chapter.system : "complete",
        Constants.Chapter.consonant0 : "complete",
        Constants.Chapter.consonant1 : "complete", // 현재 가장 최신의 진도
        Constants.Chapter.consonant2 : "complete",
        Constants.Chapter.consonant3 : "complete",
        Constants.Chapter.consonant4 : "complete",
        Constants.Chapter.consonant5 : "complete",
        Constants.Chapter.vowel0 : "complete",
        Constants.Chapter.vowel1 : "complete",
        Constants.Chapter.vowel2 : "complete",
        Constants.Chapter.vowel3 : "complete",
        Constants.Chapter.vowel4 : "complete",
        Constants.Chapter.batchim0: "complete",
        Constants.Chapter.batchim1 : "complete",
        Constants.Chapter.batchim2 : "complete",
        Constants.Chapter.batchim3 : "currentSession",
    ]
    @AppStorage("wrongCount") var wrongCount: [String:String] = [:]

    @Published var content: [HangulCard] = HangulUnitEnum.vowel1
    @Published var quiz: [HangulQuiz] = HangulUnitQuizEnum.consonant1
    @Published var storage: [HangulCard] = []
    @Published var nowStudying: String = Constants.Chapter.vowel1 // 현재 공부하고 있는 단원 (진도와는 무관)
    @Published var chapterType: ChapterType = .vowel
    @Published var lessonType: lessonType = .lesson
    @Published var index: Int = 0
    
    init() {
    }
    
    func createContent(chapterName: String) {
        switch chapterName {
        case Constants.Chapter.system:
            content = HangulUnitEnum.system
            quiz = HangulUnitQuizEnum.system
            chapterType = .system
        
        case Constants.Chapter.consonant0:
            content = HangulUnitEnum.consonant0
            quiz = HangulUnitQuizEnum.consonant0
            chapterType = .consonant
            
        case Constants.Chapter.consonant1:
            content = HangulUnitEnum.consonant1
            quiz = HangulUnitQuizEnum.consonant1
            chapterType = .consonant
            
        case Constants.Chapter.consonant2:
            content = HangulUnitEnum.consonant2
            quiz = HangulUnitQuizEnum.consonant2
            chapterType = .consonant
            
        case Constants.Chapter.consonant3:
            content = HangulUnitEnum.consonant3
            quiz = HangulUnitQuizEnum.consonant3

            chapterType = .consonant

        case Constants.Chapter.consonant4:
            content = HangulUnitEnum.consonant4
            quiz = HangulUnitQuizEnum.consonant4

            chapterType = .consonant
            
        case Constants.Chapter.consonant5:
            content = HangulUnitEnum.consonant5
            quiz = HangulUnitQuizEnum.consonant5
            chapterType = .consonant
            
        case Constants.Chapter.vowel0:
            content = HangulUnitEnum.vowel0
            quiz = HangulUnitQuizEnum.vowel0
            chapterType = .vowel
            
        case Constants.Chapter.vowel1:
            content = HangulUnitEnum.vowel1
            quiz = HangulUnitQuizEnum.vowel1
            chapterType = .vowel

        case Constants.Chapter.vowel2:
            content = HangulUnitEnum.vowel2
            quiz = HangulUnitQuizEnum.vowel2
            chapterType = .vowel

        case Constants.Chapter.vowel3:
            content = HangulUnitEnum.vowel3
            quiz = HangulUnitQuizEnum.vowel3
            chapterType = .vowel
            
        case Constants.Chapter.vowel4:
            content = HangulUnitEnum.vowel4
            quiz = HangulUnitQuizEnum.vowel4
            chapterType = .vowel
         
        case Constants.Chapter.batchim0:
            content = HangulUnitEnum.batchim0
            quiz = HangulUnitQuizEnum.batchim0
            chapterType = .batchim
            
        case Constants.Chapter.batchim1:
            content = HangulUnitEnum.batchim1
            quiz = HangulUnitQuizEnum.batchim1
            chapterType = .batchim
            
        case Constants.Chapter.batchim2:
            content = HangulUnitEnum.batchim2
            quiz = HangulUnitQuizEnum.batchim2
            chapterType = .batchim
            
        case Constants.Chapter.batchim3:
            content = HangulUnitEnum.batchim3
            quiz = HangulUnitQuizEnum.batchim3
            chapterType = .batchim
            
        default:
            return
        }
    }
    
    func endChapter() {
        if completedDates[nowStudying] == nil { // 처음으로 공부를 완료한 단원이라면
            let completedDate = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy.MM.dd HH:mm"
            
            completedDates.updateValue(dateFormatter.string(from: completedDate), forKey: nowStudying)
            chapterState[nowStudying] = "complete"
            
            for i in 0 ..< Constants.Chapter.chapters.count {
                if nowStudying == Constants.Chapter.chapters[i] {
                    if nowStudying != Constants.Chapter.vowel3 {
                        chapterState[Constants.Chapter.chapters[i + 1]] = "currentSession"
                    }
                }
            }
        }
        
        nowStudying = ""
    }
}
