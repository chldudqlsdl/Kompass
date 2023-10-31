//
//  HangulEducationView.swift
//  Orum
//
//  Created by 차차 on 10/31/23.
//

import SwiftUI

struct HangulEducationView: View {
    @Binding var isPresented: Bool
    @Binding var content: HangulUnit
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    isPresented.toggle()
                }) {
                    Image(systemName: "x.circle.fill")
                }
                
                Spacer()
            }
            .padding(.horizontal, 15)
            
            Spacer()
        }
    }
}

#Preview {
    HangulEducationView(isPresented: .constant(true), content: .constant(HangulUnit(unitName: "Consonant1", unitIndex: 1, hangulCards: [])))
}
