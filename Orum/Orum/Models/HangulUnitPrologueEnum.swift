//
//  HangulUnitPrologueEnum.swift
//  Orum
//
//  Created by Youngbin Choi on 11/20/23.
//

import Foundation

struct HangulUnitPrologueEnum: RawRepresentable { // 자모 분리를 통해서 ㄱ -> g & 가 -> ga, 구 -> gu 로 변환 되게 하기
    let rawValue: Int
    
    static let onboarding: [HangulPrologue] = [
        HangulPrologue(prologueType: .onboarding, name: "onboarding0"),
        HangulPrologue(prologueType: .onboarding, name: "onboarding1"),
        HangulPrologue(prologueType: .onboarding, name: "onboarding2"),
        HangulPrologue(prologueType: .onboarding, name: "onboarding3"),
    ]
    
    static let system: [HangulPrologue] = [
        HangulPrologue(prologueType: .system, name: "system0"),
        HangulPrologue(prologueType: .system, name: "system1"),
        HangulPrologue(prologueType: .system, name: "system2"),
        HangulPrologue(prologueType: .system, name: "system3"),
    ]
    
    static let consonant: [HangulPrologue] = [
        HangulPrologue(prologueType: .consonant, name: "consonant0"),
        HangulPrologue(prologueType: .consonant, name: "consonant1"),
        HangulPrologue(prologueType: .consonant, name: "consonant2"),
        HangulPrologue(prologueType: .consonant, name: "consonant3"),
        HangulPrologue(prologueType: .consonant, name: "consonant4"),
    ]
    
    static let vowel: [HangulPrologue] = [
        HangulPrologue(prologueType: .vowel, name: "vowel0"),
        HangulPrologue(prologueType: .vowel, name: "vowel1"),
        HangulPrologue(prologueType: .vowel, name: "vowel2"),
        HangulPrologue(prologueType: .vowel, name: "vowel3"),
    ]
    
    static let batchim: [HangulPrologue] = [
        HangulPrologue(prologueType: .batchim, name: "batchim0"),
        HangulPrologue(prologueType: .batchim, name: "batchim1"),
        HangulPrologue(prologueType: .batchim, name: "batchim2"),
        HangulPrologue(prologueType: .batchim, name: "batchim3"),
    ]
    
}
