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
    
    @EnvironmentObject var educationManager: EducationManager
    
    @State var chapterIndex: Int
    
    var chapterName: String {
        switch chapterIndex {
        case 0:
            "System"
        case 1:
            "Consonant (Jaeum)"
        case 2:
            "Vowel (Moeum)"
        case 3:
            "Last Consonant (Batchim)"
        default:
            ""
        }
    }
    
    var body: some View {
            Text("\(chapterName)")
                .bold()
                .font(.title2)
            
            ForEach (0 ..< lessonNum[chapterIndex]) { index in
                Lesson(action: action, chapterIndex: chapterIndex, lessonIndex: index)
                    .environmentObject(educationManager)
            }
    }
}

#Preview {
    Chapter(action: {}, chapterIndex: 1)
        .environmentObject(EducationManager())
    
}
