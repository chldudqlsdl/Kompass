//
//  SearchResultView.swift
//  Orum
//
//  Created by 차차 on 10/31/23.
//

import SwiftUI

struct SearchResultView: View {
    @Binding var isPresented: Bool
    @Binding var chapterName: String
    
    @EnvironmentObject var educationManager: EducationManager
    
    @State var content: [HangulCard] = HangulUnitEnum.consonant1
    
    
    var body: some View {
        NavigationView {
//            HangulEducationRecapView(progressValue: $1, currentEducation: $CurrentEducation.recap)
//                .environmentObject(educationManager)
//                .navigationBarItems(leading: Button(action: {
//                    isPresented.toggle()
//                }){
//                    Image(systemName: "x.circle.fill")
//                        .foregroundStyle(.blue, Color(uiColor: .systemGray4))
//                        .symbolRenderingMode(.palette)
//                })
//                .navigationTitle("\(chapterName)")
//                .navigationBarTitleDisplayMode(.inline)
//                .padding(.horizontal, 15)
            Text("A")
        }
    }
}

#Preview {
    SearchResultView(isPresented: .constant(true), chapterName: .constant(Constants.Chapter.consonant1))
        .environmentObject(EducationManager())
}
