//
//  HangulPrologue.swift
//  Orum
//
//  Created by Youngbin Choi on 11/20/23.
//

import Foundation
import SwiftUI

struct HangulPrologue {

    let name : String
    let title : String
    let text : String
    let image : [String]
    let color : [Color]
    let type : PrologueType
    
    init(prologueType: PrologueType , name: String) {
        self.name = name
        self.title = Constants.Prologue.title[name] ?? ""
        self.text = Constants.Prologue.text[name] ?? ""
        self.image = Constants.Prologue.image[name] ?? [""]
        self.type = prologueType
        
        switch prologueType {
        case .onboarding:
            color = [Color("onboardingMain"), Color("onboardingSub")]
        case .system:
            color = [Color("systemMain"), Color("systemSub")]
        case .consonant:
            color = [Color("consonantMain"), Color("consonantSub")]
        case .vowel:
            color = [Color("vowelMain"), Color("vowelSub")]
        case .batchim:
            color = [Color("batchimMain"), Color("batchimSub")]
        
        }
    }
}

enum PrologueType {
    case system, consonant, vowel, batchim, onboarding
}
