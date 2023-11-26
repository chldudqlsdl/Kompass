//
//  HangulUnitPrologueEnum.swift
//  Orum
//
//  Created by Youngbin Choi on 11/20/23.
//

import Foundation

struct HangulUnitPrologueEnum: RawRepresentable {
    let rawValue: Int
    
    static let system: [HangulPrologue] = [
        HangulPrologue(prologueType: .system, name: "system0"),
        HangulPrologue(prologueType: .system, name: "system1"),
        HangulPrologue(prologueType: .system, name: "system2"),
        HangulPrologue(prologueType: .system, name: "system3"),
    ]
    
    static let consonant0: [HangulPrologue] = [
        HangulPrologue(prologueType: .consonant, name: "consonant0"),
        HangulPrologue(prologueType: .consonant, name: "consonant1"),
        HangulPrologue(prologueType: .consonant, name: "consonant2"),
        HangulPrologue(prologueType: .consonant, name: "consonant3"),
    ]
    
    static let vowel0: [HangulPrologue] = [
        HangulPrologue(prologueType: .vowel, name: "system0"),
        HangulPrologue(prologueType: .vowel, name: "system1"),
        HangulPrologue(prologueType: .vowel, name: "system2"),
        HangulPrologue(prologueType: .vowel, name: "system3"),
    ]
    
    static let batchim0: [HangulPrologue] = [
        HangulPrologue(prologueType: .batchim, name: "system0"),
        HangulPrologue(prologueType: .batchim, name: "system1"),
        HangulPrologue(prologueType: .batchim, name: "system2"),
        HangulPrologue(prologueType: .batchim, name: "system3"),
    ]
    
}
