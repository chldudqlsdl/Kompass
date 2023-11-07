//
//  SearchView.swift
//  Orum
//
//  Created by 차차 on 10/31/23.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @State var isPresented = false
    @State var searchResult = SearchResult()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 34) {
                    VStack {
                        HStack {
                            Text("System")
                                .bold()
                                .font(.title2)
                            Spacer()
                        }
                        
                        HStack(spacing: 16) {
                            Button(action: {
                                searchResult.level = .system
                                isPresented.toggle()
                            })
                            {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 8)
                                        .frame(height: 90)
                                    
                                    VStack {
                                        HStack {
                                            Text("Tutorial")
                                                .bold()
                                                .font(.title2)
                                                .foregroundColor(.white)
                                                .padding(.leading, 10)
                                                .padding(.top, 8)
                                            
                                            Spacer()
                                        }
                                        
                                        Spacer()
                                    }
                                }
                            }
                            
                            Button(action: {
                                searchResult.level = .system
                                isPresented.toggle()
                            })
                            {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 8)
                                        .frame(minHeight: 90)
                                    
                                    VStack {
                                        HStack {
                                            Text("Combine")
                                                .bold()
                                                .font(.title2)
                                                .foregroundColor(.white)
                                                .padding(.leading, 10)
                                                .padding(.top, 8)
                                            
                                            Spacer()
                                        }
                                        
                                        Spacer()
                                    }
                                }
                            }
                        }
                    }
                    
                    VStack(spacing: 16) {
                        HStack {
                            Text("Basic")
                                .bold()
                                .font(.title2)
                            
                            Spacer()
                        }
                        ForEach(0 ..< 3) { number in
                            HStack(spacing: 16) {
                                Button(action: {
                                    searchResult.level = .basic
                                    isPresented.toggle()
                                })
                                {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 8)
                                            .frame(minHeight: 90)
                                        
                                        VStack {
//                                            HStack {
//                                                Text("\(Constants.Chapter.chapterComponent[[2 * number].concatArray())")
//                                                    .bold()
//                                                    .font(.title2)
//                                                    .foregroundColor(.white)
//                                                    .padding(.leading, 10)
//                                                    .padding(.top, 8)
//                                                
//                                                Spacer()
//                                            }
                                            
                                            Spacer()
                                        }
                                    }
                                }
                                
                                Button(action: {
                                    searchResult.level = .basic
                                    isPresented.toggle()
                                })
                                {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 8)
                                            .frame(minHeight: 90)
                                        
                                        VStack {
//                                            HStack {
//                                                Text("\(Constants.Chapter.chapterComponent[2 * number + 1].concatArray())")
//                                                    .bold()
//                                                    .font(.title2)
//                                                    .foregroundColor(.white)
//                                                    .padding(.leading, 10)
//                                                    .padding(.top, 8)
//                                                
//                                                Spacer()
//                                            }
                                            
                                            Spacer()
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                    VStack(spacing: 16) {
                        HStack {
                            Text("Advance")
                                .bold()
                                .font(.title2)
                            
                            Spacer()
                        }
                        
                        HStack(spacing: 16) {
                            Button(action: {
                                searchResult.level = .advance
                                isPresented.toggle()
                            })
                            {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 8)
                                        .frame(minHeight: 90)

                                    
                                    VStack {
                                        HStack {
                                            Text("ㄲㄸㅃㅆㅉ")
                                                .bold()
                                                .font(.title2)
                                                .foregroundColor(.white)
                                                .padding(.leading, 10)
                                                .padding(.top, 8)
                                            
                                            Spacer()
                                        }
                                        
                                        Spacer()
                                    }
                                }
                            }
                            
                            Button(action: {
                                searchResult.level = .advance
                                isPresented.toggle()
                            })
                            {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 8)
                                        .frame(minHeight: 90)

                                    
                                    VStack {
                                        HStack {
                                            Text("ㅢㅚㅟㅘㅝㅙㅞ")
                                                .bold()
                                                .font(.title2)
                                                .foregroundColor(.white)
                                                .padding(.leading, 10)
                                                .padding(.top, 8)
                                            
                                            Spacer()
                                        }
                                        
                                        Spacer()
                                    }
                                }
                            }
                        }
                        
                    }
                }
            }
            .padding(.horizontal, 15)
            .navigationTitle("Search")
            .scrollIndicators(.hidden)
        }
        .searchable(text: $searchText)
        .fullScreenCover(isPresented: $isPresented, content: {
            SearchResultView(isPresented: $isPresented, searchResult: $searchResult)
        })
    }
}

#Preview {
    SearchView()
}
