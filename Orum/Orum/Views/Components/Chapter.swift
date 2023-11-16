//
//  Chapter.swift
//  Orum
//
//  Created by 차차 on 11/6/23.
//

import SwiftUI

struct Chapter: View {
    let action: () -> ()
    let lessonNum: [Int] = [1, 6, 5, 4]
    let lessonNums = 1
    
    @EnvironmentObject var educationManager: EducationManager
    
    @State var chapterIndex: Int
    
    var chapterName: String {
        switch chapterIndex {
        case 0:
            "한글 (Hangul)"
        case 1:
            "자음 (Consonant)"
        case 2:
            "모음 (Vowel)"
        case 3:
            "받침 (Final Consonant)"
        default:
            ""
        }
    }
    
    var body: some View {
            Text("\(chapterName)")
                .bold()
                .font(.title2)
            
        ForEach (0 ..< lessonNum[chapterIndex], id: \.self) { index in
                Lesson(action: action, chapterIndex: chapterIndex, lessonIndex: index)
                    .environmentObject(educationManager)
            }
    }
}

#Preview {
    Chapter(action: {}, chapterIndex: 1)
        .environmentObject(EducationManager())
    
}
