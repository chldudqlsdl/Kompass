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
    let color : [UIColor]
    let type : PrologueType
    
    init(prologueType: PrologueType , name: String) {
        self.name = name
        self.title = Constants.Prologue.title[name] ?? ""
        self.text = Constants.Prologue.text[name] ?? ""
        self.image = Constants.Prologue.image[name] ?? [""]
        self.type = prologueType
        
        switch prologueType {
        case .system:
            color = [UIColor(hex: "33BBED"), UIColor(hex: "18A5D9")]
        case .consonant:
            color = [UIColor(hex: "64C396"), UIColor(hex: "2DB173")]
        case .vowel:
            color = [UIColor(hex: "FEAA00"), UIColor(hex: "EF8100")]
        case .batchim:
            color = [UIColor(hex: "F07E96"), UIColor(hex: "EA4769")]
        }
    }
}

enum PrologueType {
    case system, consonant, vowel, batchim
}
