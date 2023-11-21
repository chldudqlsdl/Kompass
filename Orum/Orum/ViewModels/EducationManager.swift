//
//  EducationManager.swift
//  Orum
//
//  Created by 차차 on 10/22/23.
//

import SwiftUI

enum LessonState: String{
    case locked = "locked"
    case currentLesson = "currentLesson"
    case complete = "complete"
}

enum ChapterType {
    case system, consonant, vowel, batchim
}

enum LessonType {
    case prologue, lesson, epilogue
}

class EducationManager: ObservableObject {
    @AppStorage("completedDate") var completedDates: [String:String] = [
        Constants.Lesson.system: "2023.11.04 16:23",
        Constants.Lesson.vowel1: ""
    ]
    @AppStorage("lessonState") var lessonState: [String:String] = [
        Constants.Lesson.system : "complete",
        Constants.Lesson.consonant0 : "complete",
        Constants.Lesson.consonant1 : "complete", // 현재 가장 최신의 진도
        Constants.Lesson.consonant2 : "complete",
        Constants.Lesson.consonant3 : "complete",
        Constants.Lesson.consonant4 : "complete",
        Constants.Lesson.consonant5 : "complete",
        Constants.Lesson.vowel0 : "complete",
        Constants.Lesson.vowel1 : "complete",
        Constants.Lesson.vowel2 : "complete",
        Constants.Lesson.vowel3 : "complete",
        Constants.Lesson.vowel4 : "complete",
        Constants.Lesson.batchim0: "complete",
        Constants.Lesson.batchim1 : "complete",
        Constants.Lesson.batchim2 : "complete",
        Constants.Lesson.batchim3 : "currentLesson",
    ]
    @AppStorage("wrongCount") var wrongCount: [String:String] = [:]
    @Published var content: [HangulCard] = HangulUnitEnum.consonant1
    @Published var quiz: [HangulQuiz] = HangulUnitQuizEnum.consonant1
    @Published var storage: [HangulCard] = []
    @Published var nowStudying: String = Constants.Lesson.consonant1 // 현재 공부하고 있는 단원 (진도와는 무관)
    @Published var chapterType: ChapterType = .vowel
    @Published var lessonType: LessonType = .lesson
    @Published var prologue: [HangulPrologue] = HangulUnitPrologueEnum.system
    @Published var index: Int = 0
    
    init() {
    }
    
    func createContent(lessonName: String) {
        switch lessonName {
        case Constants.Lesson.system:
            content = HangulUnitEnum.system
            quiz = HangulUnitQuizEnum.system
            chapterType = .system
            lessonType = .prologue
            prologue = HangulUnitPrologueEnum.system
        
        case Constants.Lesson.consonant0:
            content = HangulUnitEnum.consonant0
            quiz = HangulUnitQuizEnum.consonant0
            chapterType = .consonant
            lessonType = .prologue
            prologue = HangulUnitPrologueEnum.consonant0
            
        case Constants.Lesson.consonant1:
            content = HangulUnitEnum.consonant1
            quiz = HangulUnitQuizEnum.consonant1
            chapterType = .consonant
            lessonType = .lesson
            
        case Constants.Lesson.consonant2:
            content = HangulUnitEnum.consonant2
            quiz = HangulUnitQuizEnum.consonant2
            chapterType = .consonant
            lessonType = .lesson
            
        case Constants.Lesson.consonant3:
            content = HangulUnitEnum.consonant3
            quiz = HangulUnitQuizEnum.consonant3
            chapterType = .consonant
            lessonType = .lesson

        case Constants.Lesson.consonant4:
            content = HangulUnitEnum.consonant4
            quiz = HangulUnitQuizEnum.consonant4
            chapterType = .consonant
            lessonType = .lesson
            
        case Constants.Lesson.consonant5:
            content = HangulUnitEnum.consonant5
            quiz = HangulUnitQuizEnum.consonant5.shuffled()
            chapterType = .consonant
            lessonType = .epilogue

        case Constants.Lesson.vowel0:
            content = HangulUnitEnum.vowel0
            quiz = HangulUnitQuizEnum.vowel0
            chapterType = .vowel
            lessonType = .prologue
            prologue = HangulUnitPrologueEnum.vowel0

        case Constants.Lesson.vowel1:
            content = HangulUnitEnum.vowel1
            quiz = HangulUnitQuizEnum.vowel1
            chapterType = .vowel
            lessonType = .lesson

        case Constants.Lesson.vowel2:
            content = HangulUnitEnum.vowel2
            quiz = HangulUnitQuizEnum.vowel2
            chapterType = .vowel
            lessonType = .lesson

        case Constants.Lesson.vowel3:
            content = HangulUnitEnum.vowel3
            quiz = HangulUnitQuizEnum.vowel3
            chapterType = .vowel
            lessonType = .lesson

        case Constants.Lesson.vowel4:
            content = HangulUnitEnum.vowel4
            quiz = HangulUnitQuizEnum.vowel4.shuffled()
            chapterType = .vowel
            lessonType = .epilogue

        case Constants.Lesson.batchim0:
            content = HangulUnitEnum.batchim0
            quiz = HangulUnitQuizEnum.batchim0
            chapterType = .batchim
            lessonType = .prologue
            prologue = HangulUnitPrologueEnum.batchim0

        case Constants.Lesson.batchim1:
            content = HangulUnitEnum.batchim1
            quiz = HangulUnitQuizEnum.batchim1
            chapterType = .batchim
            lessonType = .lesson

        case Constants.Lesson.batchim2:
            content = HangulUnitEnum.batchim2
            quiz = HangulUnitQuizEnum.batchim2
            chapterType = .batchim
            lessonType = .lesson

        case Constants.Lesson.batchim3:
            content = HangulUnitEnum.batchim3
            quiz = HangulUnitQuizEnum.batchim3
            chapterType = .batchim
            lessonType = .epilogue

        default:
            return
        }
    }
    
    func endLesson() {
        if completedDates[nowStudying] == nil { // 처음으로 공부를 완료한 단원이라면
            let completedDate = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy.MM.dd HH:mm"
            
            completedDates.updateValue(dateFormatter.string(from: completedDate), forKey: nowStudying)
            lessonState[nowStudying] = "complete"
            
            for i in 0 ..< Constants.Lesson.lessons.count {
                if nowStudying == Constants.Lesson.lessons[i] {
                    if nowStudying != Constants.Lesson.vowel3 {
                        lessonState[Constants.Lesson.lessons[i + 1]] = "currentLesson"
                    }
                }
            }
        }
        
        nowStudying = ""
    }
}
