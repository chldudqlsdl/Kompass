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
    @AppStorage("practicedLessons") var practicedLessons: [String] = []
    
    @Published var chapterIndex = 0
    @Published var lessonIndex = 0
}
