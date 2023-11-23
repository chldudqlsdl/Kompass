//
//  PracticeManager.swift
//  Orum
//
//  Created by Youngbin Choi on 11/18/23.
//

import Foundation
import SwiftUI

class PracticeManager: ObservableObject {
    
    @AppStorage("practicedChapters") var practicedChapters: [String] = []
    @AppStorage("practicedWords") var practicedWords: [String] = []
    
    @Published var chapterIndex = 0
}
