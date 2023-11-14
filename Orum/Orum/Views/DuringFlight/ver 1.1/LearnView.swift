//
//  LearnView.swift
//  Orum
//
//  Created by 차차 on 10/31/23.
//

import SwiftUI


struct LearnView: View {
    @EnvironmentObject var educationManager: EducationManager
        
    @State private var isPresented = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                Divider()
                
                VStack(alignment: .leading,spacing: 16) {
                    ForEach (0 ..< 4) { ind in
                        Category(action: {
                            isPresented.toggle()
                        }, categoryInd: ind)
                    .environmentObject(educationManager)
                    }
                }
                .padding(.horizontal, 15)
            }
            .navigationTitle("Learn")
            .fullScreenCover(isPresented: $isPresented, content: {
                HangulEducationView(isPresented: $isPresented)
                    .environmentObject(educationManager)
            })
        }
    }
}


#Preview {
        LearnView()
        .environmentObject(EducationManager())
}
