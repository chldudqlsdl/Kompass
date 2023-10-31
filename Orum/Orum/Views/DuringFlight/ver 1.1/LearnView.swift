//
//  LearnView.swift
//  Orum
//
//  Created by 차차 on 10/31/23.
//

import SwiftUI

struct LearnView: View {
    @State private var isPresented = false
    @State private var remainingTime: Int = 0
    @EnvironmentObject var educationManager: EducationManager
    
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Spacer()
                    
                    Text("1:04:30")
                        .bold()
                        .font(.caption2)
                }
                
                HStack {
                    Text("5%")
                        .bold()
                        .font(.caption2)
                    
                    Spacer()
                        .frame(width: 10)
                    
                    Image(systemName: "airplane")
                        .bold()
                        .font(.caption2)
                    
                    Spacer()
                }
            }
            .padding(.horizontal, 15)
            
            Spacer()
            
            Button(action:{
                isPresented.toggle()
                educationManager.createContent()
            }){
                Text("Bottom Sheet Up")
            }
            
            Spacer()
        }
        .fullScreenCover(isPresented: $isPresented, content: {
            HangulEducationView(isPresented: $isPresented, content: educationManager.content)
                .environmentObject(educationManager)
        })
        
    }
}

#Preview {
    LearnView()
        .environmentObject(EducationManager())
}
