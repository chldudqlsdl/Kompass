//
//  LessonEndingView.swift
//  Orum
//
//  Created by 차차 on 11/23/23.
//

import ConfettiSwiftUI
import SwiftUI

struct LessonEndingView: View {
    @Binding var isPresented: Bool
    
    @EnvironmentObject var educationManager: EducationManager
    
    @State private var counter: Int = 0
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Well Done!")
                .bold()
                .font(.largeTitle)
                .confettiCannon(counter: $counter, num: 50, confettis: [.image("ㄱ"),.image("ㄴ"),.image("ㄷ"),.image("ㄹ")], confettiSize: 40)

            Spacer()
            
            VStack(spacing: 8) {
                Button(action: {
                    educationManager.endLesson()
                    isPresented.toggle()
                }, label: {
                    Text("Complete")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                })
                .buttonStyle(.borderedProminent)
            }
        }
        .padding(.horizontal, 16)
        .onAppear {
            counter += 1
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    LessonEndingView(isPresented: .constant(false))
}
