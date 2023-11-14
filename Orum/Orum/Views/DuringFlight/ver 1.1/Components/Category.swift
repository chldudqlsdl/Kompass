//
//  Category.swift
//  Orum
//
//  Created by 차차 on 11/6/23.
//

import SwiftUI

struct Category: View {
    let action: () -> ()
    let chaptersNum: [Int] = [1, 6, 5, 4]
    
    @EnvironmentObject var educationManager: EducationManager
    
    @State var categoryInd: Int
    
    var categoryName: String {
        switch categoryInd {
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
            Text("\(categoryName)")
                .bold()
                .font(.title2)
            
            ForEach (0 ..< chaptersNum[categoryInd]) { ind in
                Chapter(action: action, categoryInd: categoryInd, chapterInd: ind)
                    .environmentObject(educationManager)
            }
    }
}

#Preview {
    Category(action: {}, categoryInd: 1)
        .environmentObject(EducationManager())
    
}
