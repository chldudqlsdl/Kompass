//
//  Lesson.swift
//  Orum
//
//  Created by 차차 on 11/20/23.
//

import Foundation

struct Lesson: Identifiable {
    let id = UUID().uuidString
    let lessonName: String
    let lessonType: LessonType
    let chapterType: ChapterType
    let lessonState: String
    let completedDates: String
    
    init(lessonName: String, lessonType: LessonType, chapterType: ChapterType) {
        let educationManager = EducationManager()
        
        self.lessonName = lessonName
        self.lessonType = lessonType
        self.chapterType = chapterType
        self.lessonState = educationManager.lessonState[lessonName] ?? "locked"
        self.completedDates = educationManager.completedDates[lessonName] ?? ""
    }
    
}

let lessons: [[Lesson]] = [
    hangulSystemLesson,
    consonantLesson,
    vowelLesson,
    batchimLesson
]

let hangulSystemLesson: [Lesson] = [
    Lesson(lessonName: Constants.Lesson.system, lessonType: .prologue, chapterType: .system)
]

let consonantLesson: [Lesson] = [
    Lesson(lessonName: Constants.Lesson.consonant0, lessonType: .prologue, chapterType: .consonant),
    Lesson(lessonName: Constants.Lesson.consonant1, lessonType: .lesson, chapterType: .consonant),
    Lesson(lessonName: Constants.Lesson.consonant2, lessonType: .lesson, chapterType: .consonant),
    Lesson(lessonName: Constants.Lesson.consonant3, lessonType: .lesson, chapterType: .consonant),
    Lesson(lessonName: Constants.Lesson.consonant4, lessonType: .lesson, chapterType: .consonant),
    Lesson(lessonName: Constants.Lesson.consonant5, lessonType: .epilogue, chapterType: .consonant),
    ]

let vowelLesson: [Lesson] = [
    Lesson(lessonName: Constants.Lesson.vowel0, lessonType: .prologue, chapterType: .vowel),
    Lesson(lessonName: Constants.Lesson.vowel1, lessonType: .lesson, chapterType: .vowel),
    Lesson(lessonName: Constants.Lesson.vowel2, lessonType: .lesson, chapterType: .vowel),
    Lesson(lessonName: Constants.Lesson.vowel3, lessonType: .lesson, chapterType: .vowel),
    Lesson(lessonName: Constants.Lesson.vowel4, lessonType: .epilogue, chapterType: .vowel),
]

let batchimLesson: [Lesson] = [
    Lesson(lessonName: Constants.Lesson.batchim0, lessonType: .prologue, chapterType: .batchim),
    Lesson(lessonName: Constants.Lesson.batchim1, lessonType: .lesson, chapterType: .batchim),
    Lesson(lessonName: Constants.Lesson.batchim2, lessonType: .lesson, chapterType: .batchim),
    Lesson(lessonName: Constants.Lesson.batchim3, lessonType: .epilogue, chapterType: .batchim),
]

