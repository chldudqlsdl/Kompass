//
//  LearnView.swift
//  Orum
//
//  Created by 차차 on 10/31/23.
//

import SwiftUI

struct LearnView: View {
    @State private var isPresented = false
//    @State var content
    @EnvironmentObject var flightManager: FlightManager
    
    var body: some View {
        VStack {
            Button(action:{
                isPresented.toggle()
                flightManager.createContent()
            }){
                Text("Bottom Sheet Up")
            }
        }
        .fullScreenCover(isPresented: $isPresented, content: {
            HangulEducationView(isPresented: $isPresented, content: $flightManager.content)
        })
    }
}

#Preview {
    LearnView()
        .environmentObject(FlightManager())
}
