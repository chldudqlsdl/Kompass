//
//  HangulCard.swift
//  Orum
//
//  Created by Youngbin Choi on 10/20/23.
//

import Foundation
import SwiftUI

struct HangulCard: Hashable {
    let name : String
    let sound : String
    var example1 : String = ""
    var example2 : String = ""
    var soundExample1 : String = ""
    var soundExample2 : String = ""
    var lottieName : String = ""
    var explanation : String = ""
    var chapterType : ChapterType = .system
    var hangulType : HangulType = .single
    
    init(name: String) {
        self.name = name
        
        if Constants.Hangul.consonants.contains(name) {
            self.sound = Constants.Hangul.consonantSound[name] ?? ""
            self.example1 = Constants.Hangul.consonantExamples[name]?[0] ?? ""
            self.example2 = Constants.Hangul.consonantExamples[name]?[1] ?? ""
            self.soundExample1 = Constants.Hangul.consonantExamples[name]?[0] ?? ""
            self.soundExample2 = Constants.Hangul.consonantExamples[name]?[1] ?? ""
            self.lottieName = Constants.Hangul.lottieName[name] ?? ""
            self.chapterType = .consonant
            if Constants.Hangul.lottieName[name] == "" {
                hangulType = .double
                self.explanation = Constants.Hangul.consonantCombination[name] ?? ""
            }
        }
        
        else if Constants.Hangul.vowels.contains(name) {
            self.sound = Constants.Hangul.vowelSound[name] ?? ""
            self.lottieName = ""
            self.chapterType = .vowel
            if Constants.Hangul.vowelSimilarSound[name] == "" {
                hangulType = .double
                self.explanation = Constants.Hangul.vowelCombination[name] ?? ""
            } else {
                hangulType = .single
                self.explanation = Constants.Hangul.vowelSimilarSound[name] ?? ""
            }
        }
        
        else { // 받침
            self.sound = Constants.Hangul.consonantSound[name] ?? ""
            self.chapterType = .batchim
        }
    }
}
enum HangulType {
    case single, double
}

enum CardType {
    case small, medium, large
}

extension CardType {
    
    var imageFrame : CGFloat {
        switch self {
        case .small:
            return 48
        case .medium:
            return 130
        case .large:
            return 180
        }
    }
    
    var maxHeight : CGFloat {
        switch self {
        case .small:
            return 72
        case .medium:
            return 170
        case .large:
            return 237
        }
    }
    
    var imageMeaningSpacing : CGFloat {
        switch self {
        case .small:
            return 3
        case .medium:
            return 12
        case .large:
            return 16
        }
    }
    
    var borderWidth : CGFloat {
        switch self {
        case .small:
            return 6
        case .medium:
            return 11
        case .large:
            return 11
        }
    }
    
    var paddingTop : CGFloat {
        switch self {
        case .small:
            return 23
        case .medium:
            return 36
        case .large:
            return 50
        }
    }
    
    var paddingBottom : CGFloat {
        switch self {
        case .small:
            return 13
        case .medium:
            return 30
        case .large:
            return 40
        }
    }
    
    var font : Font {
        switch self {
        case .small:
            return .body
        case .medium:
            return .title2
        case .large:
            return .largeTitle
        }
    }
    
    var cornerRadius : CGFloat {
        switch self {
        case .small:
            return 12
        case .medium:
            return 24
        case .large:
            return 24
        }
    }
    
    func explanationFont( _ chapterType : ChapterType) -> Font {
        switch self {
        case .small:
            if chapterType == .consonant {
                return .body
            } else if chapterType == .vowel {
                return .footnote
            } else {
                return .footnote
            }
        case .medium:
            if chapterType == .consonant {
                return .title2
            } else if chapterType == .vowel {
                return .body
            } else {
                return .body
            }
        case .large:
            if chapterType == .consonant {
                return .largeTitle
            } else if chapterType == .vowel {
                return .title2
            } else {
                return .title2
            }
            
        }
    }
}



