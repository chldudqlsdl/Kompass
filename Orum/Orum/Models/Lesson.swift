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
    
    init(lessonName: String) {
        let educationManager = EducationManager()
        
        self.lessonName = lessonName
        self.lessonType = .lesson
        self.chapterType = .consonant
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
    Lesson(lessonName: Constants.Lesson.system)
]

let consonantLesson: [Lesson] = [
    Lesson(lessonName: Constants.Lesson.consonant0),
    Lesson(lessonName: Constants.Lesson.consonant1),
    Lesson(lessonName: Constants.Lesson.consonant2),
    Lesson(lessonName: Constants.Lesson.consonant3),
    Lesson(lessonName: Constants.Lesson.consonant4),
    Lesson(lessonName: Constants.Lesson.consonant5),
    ]

let vowelLesson: [Lesson] = [
    Lesson(lessonName: Constants.Lesson.vowel0),
    Lesson(lessonName: Constants.Lesson.vowel1),
    Lesson(lessonName: Constants.Lesson.vowel2),
    Lesson(lessonName: Constants.Lesson.vowel3),
    Lesson(lessonName: Constants.Lesson.vowel4),
]

let batchimLesson: [Lesson] = [
    Lesson(lessonName: Constants.Lesson.batchim0),
    Lesson(lessonName: Constants.Lesson.batchim1),
    Lesson(lessonName: Constants.Lesson.batchim2),
    Lesson(lessonName: Constants.Lesson.batchim3),
]

