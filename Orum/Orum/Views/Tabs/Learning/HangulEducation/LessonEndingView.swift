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
            
            ZStack {
                Text("Well Done!")
                    .bold()
                    .font(.largeTitle)
                
                // 최초 발사용
                VStack {
                    EmptyView()
                        .confettiCannon(counter: $counter, num: 21, confettiSize: 5, rainHeight: 1000, openingAngle: Angle.degrees(30), closingAngle: Angle.degrees(150),radius: 360)
                        .offset(y: -40)
                }
                
                // 위에서 지속적으로 내려오는 가루
                VStack {
                    EmptyView()
                        .confettiCannon(counter: $counter, num: 5, confettiSize: 5, rainHeight: 1000, openingAngle: Angle.degrees(30), closingAngle: Angle.degrees(150),radius: 360, repetitions: 200, repetitionInterval: 0.2)
                        .offset(y: -300)
                }
                
            }

            Spacer()
            
            VStack(spacing: 8) {
                Button(action: {
                    educationManager.endLesson()
                    isPresented.toggle()
                }, label: {
                    Text("Exit")
                        .padding()
                })
                
                Button(action: {
                    
                }, label: {
                    Text("Next Lesson \(Image(systemName: "forward.fill"))")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                })
                .buttonStyle(.borderedProminent)
                .padding(.bottom, 16)
            }
        }
        .padding(.horizontal, 16)
        .onAppear {
            counter += 1
        }
    }
}

#Preview {
    LessonEndingView(isPresented: .constant(false))
}
