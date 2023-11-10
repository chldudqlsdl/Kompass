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
    case system, consonant, vowel
}

class EducationManager: ObservableObject {
    @AppStorage("completedDate") var completedDates: [String:String] = [
        Constants.Chapter.system: "2023.11.04 16:23",
    ]
    @AppStorage("chapterState") var chapterState: [String:String] = [
        Constants.Chapter.system : "complete",
        Constants.Chapter.consonant1 : "currentSession", // 현재 가장 최신의 진도
        Constants.Chapter.consonant2 : "locked",
        Constants.Chapter.consonant3 : "locked",
        Constants.Chapter.consonant4 : "locked",
        Constants.Chapter.consonant5 : "locked",
        Constants.Chapter.vowel1 : "complete",
        Constants.Chapter.vowel2 : "locked",
        Constants.Chapter.vowel3 : "locked",
    ]
    @AppStorage("wrongCount") var wrongCount: [String:String] = [:]

    @Published var content: [HangulCard] = HangulUnitEnum.consonant1
    @Published var quiz: [HangulCard] = HangulUnitEnum.consonant1
    @Published var storage: [HangulCard] = []
    @Published var nowStudying: String = Constants.Chapter.consonant1 // 현재 공부하고 있는 단원 (진도와는 무관)
    @Published var chapterType: ChapterType = .consonant
    @Published var index: Int = 0
//    @Published var wrongCount: [String : Int] = [:]
    
    init() {
    }
    
    func createContent(chapterName: String) {
        switch chapterName {
        case Constants.Chapter.system:
            content = HangulUnitEnum.system
            quiz = HangulUnitEnum.system
            chapterType = .system
        
        case Constants.Chapter.consonant1:
            content = HangulUnitEnum.consonant1
            quiz = HangulUnitEnum.consonant1
            chapterType = .consonant
            
        case Constants.Chapter.consonant2:
            content = HangulUnitEnum.consonant2
            quiz = HangulUnitEnum.consonant2
            chapterType = .consonant
            
        case Constants.Chapter.consonant3:
            content = HangulUnitEnum.consonant3
            quiz = HangulUnitEnum.consonant3

            chapterType = .consonant

        case Constants.Chapter.consonant4:
            content = HangulUnitEnum.consonant4
            quiz = HangulUnitEnum.consonant4

            chapterType = .consonant
            
        case Constants.Chapter.consonant5:
            content = HangulUnitEnum.consonant5
            quiz = HangulUnitEnum.consonant5
            chapterType = .consonant
            
        case Constants.Chapter.vowel1:
            content = HangulUnitEnum.vowel1
            quiz = HangulUnitEnum.vowel1
            chapterType = .vowel

        case Constants.Chapter.vowel2:
            content = HangulUnitEnum.vowel2
            quiz = HangulUnitEnum.vowel2
            chapterType = .vowel

        case Constants.Chapter.vowel3:
            content = HangulUnitEnum.vowel3
            quiz = HangulUnitEnum.vowel3
            chapterType = .vowel
            
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
