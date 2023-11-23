//
//  EpilogueLessonView.swift
//  Orum
//
//  Created by 차차 on 11/14/23.
//

import SwiftUI

struct EpilogueLessonView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
            Text("Epilogue")
    }
}

#Preview {
    EpilogueLessonView(isPresented: .constant(false))
}
