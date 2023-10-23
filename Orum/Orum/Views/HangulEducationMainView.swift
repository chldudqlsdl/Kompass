//
//  HangulEducationMainView.swift
//  Orum
//
//  Created by 차차 on 10/22/23.
//

import SwiftUI

struct HangulEducationMainView: View {
    
    
    var body: some View {
        List {
            Section {   
                HStack {
                    Text("5%")
                    
                    Image(systemName: "airplane")
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 7)
                .background(.white)
                .cornerRadius(29)
                .overlay(RoundedRectangle(cornerRadius: 29)
                    .inset(by: 0.5)
                    .stroke(.black, lineWidth: 1)
                )
            }
            .listRowBackground(Color.clear)
            
            Section(header: Text("Hangul")) {
                
            }
            
            Section {
                Text("학습을 진행해서 발음을 모아봐요!")
                
            }
            .listRowBackground(Color.clear)

            
            Section {
                HStack {
                    Text("Current Progress")
                    
                    Spacer()
                    
                    Text("0%")
                }
            }
            Button(action: {
                
            }){
                Text("Next - Consonants 1")
            }
            
            
        }
    }
}

#Preview {
    HangulEducationMainView()
}
