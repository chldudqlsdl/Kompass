//
//  SearchResultView.swift
//  Orum
//
//  Created by 차차 on 10/31/23.
//

import SwiftUI

struct SearchResultView: View {
    @Binding var isPresented: Bool
    @Binding var searchResult: SearchResult
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                Divider()
                
                VStack {
                    HStack {
                        Text("Touch card for more information")
                            .bold()
                            .font(.title2)
                        Spacer()
                    }
                    
                    HStack {
                        
                    }
                    
                    HStack {
                        
                    }
                }
                .navigationBarItems(leading: Button(action: {
                    isPresented.toggle()
                }){
                    Image(systemName: "x.circle.fill")
                        .foregroundStyle(.blue, Color(uiColor: .systemGray4))
                        .symbolRenderingMode(.palette)
                })
                .navigationTitle("\(searchResult.level.rawValue)")
                .padding(.horizontal, 15)
                
                Spacer()
            }
        }
    }
}

#Preview {
    SearchResultView(isPresented: .constant(true), searchResult: .constant(SearchResult()))
}
