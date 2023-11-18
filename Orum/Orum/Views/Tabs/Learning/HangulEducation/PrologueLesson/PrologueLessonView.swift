//
//  PrologueLessonView.swift
//  Orum
//
//  Created by 차차 on 11/14/23.
//

import SwiftUI

struct PrologueLessonView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Prologue")
            }
            .navigationBarItems(leading: Button(action: {
                isPresented.toggle()
            }, label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title3)
                    .foregroundStyle(.blue, Color(uiColor: .secondarySystemFill))
            }))
        }
    }
}

#Preview {
    PrologueLessonView(isPresented: .constant(true))
}
