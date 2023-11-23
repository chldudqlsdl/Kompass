//
//  BatchimExplainView.swift
//  Orum
//
//  Created by Youngbin Choi on 11/22/23.
//

import SwiftUI

struct BatchimExplainView: View {
    
    var explainTitle : String
    var explain : String
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text(explainTitle)
                    .bold()
                    .font(.body)
                
                Spacer()
            }
            .padding(EdgeInsets(top: 16, leading: 16, bottom: 5, trailing: 16))
            
            Divider()
                .padding(.leading, 16)
            
            Text(explain)
                .padding(EdgeInsets(top: 5, leading: 16, bottom: 16, trailing: 16))
        }
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(uiColor: .quaternarySystemFill))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .strokeBorder(Color(uiColor: .secondarySystemFill), lineWidth: 0.5, antialiased: true)
        )
    }
}

#Preview {
    BatchimExplainView(explainTitle: "title", explain: "body")
}
