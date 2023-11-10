//
//  SearchView.swift
//  Orum
//
//  Created by 차차 on 10/31/23.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var educationManager: EducationManager
    
    @State var isPresented = false
    @State var chapterName: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 8), GridItem(.flexible())],spacing: 16) {
                        ForEach(0 ..< 3) { index in
                            VStack(alignment: .leading) {
                                Button(action: {
                                    chapterName = Constants.Chapter.chapters[index + 1]
                                    isPresented.toggle()
                                }, label: {
                                    RoundedRectangle(cornerRadius: 8)
                                        .frame(height: 87)
                                })
                                
                                Text("\(Constants.Chapter.chapters[index + 1])")
                                    .bold()
                                
                                Text("\(Constants.Chapter.chapterComponent[1][index].concatArray())")
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    
                    Divider()
                        .padding(.leading, 16)
                    
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 8), GridItem(.flexible())],spacing: 16) {
                        ForEach(0 ..< 3) { index in
                                VStack(alignment: .leading) {
                                    Button(action: {
                                        chapterName = Constants.Chapter.chapters[index + 6]
                                        isPresented.toggle()
                                    }, label: {
                                        RoundedRectangle(cornerRadius: 8)
                                            .frame(height: 87)
                                    })

                                    
                                    Text("\(Constants.Chapter.chapters[index + 6])")
                                        .bold()
                                    
                                    Text("\(Constants.Chapter.chapterComponent[2][index].concatArray())")
                                        .foregroundStyle(.secondary)
                                    
                                }
                        }
                    }
                    .padding(.horizontal, 16)
                    
                }
                
            }
            .navigationTitle("Recap")
            .scrollIndicators(.hidden)
        }
        .sheet(isPresented: $isPresented, content: {
            SearchResultView(isPresented: $isPresented, chapterName: $chapterName)
                .environmentObject(educationManager)
                .presentationDetents([.large])
                .presentationDragIndicator(.visible)
        })
    }
}

#Preview {
    SearchView()
        .environmentObject(EducationManager())
}
