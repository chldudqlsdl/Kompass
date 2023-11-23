//
//  CollectionView.swift
//  Orum
//
//  Created by 차차 on 11/15/23.
//

import SwiftUI

struct CollectionView: View {
    @EnvironmentObject var educationManager: EducationManager
    
    @State var chapterName: String = ""
//    @State var isConsonantPage = false
//    @State var isVowelPage = false
//    @State var isBatchimPage = false
    @State var isPresented = false
    @State var mistakes: [HangulCard] = []
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    VStack(spacing: 8) {
                        Divider()
                        
                        
                        VStack(spacing: 8) {
                            Button(action: {
                                chapterName = "Consonant"
//                                isConsonantPage.toggle()
                                isPresented.toggle()
                            }, label: {
                                HStack(alignment: .top, spacing: 11) {
                                    Text("ㄱ")
                                        .bold()
                                        .font(.body)
                                        .padding(.all, 4)
                                        .overlay(
                                            Circle()
                                                .stroke(lineWidth: 2)
                                        )
                                    
                                    
                                    VStack(spacing: 16) {
                                        HStack {
                                            Text("Consonant")
                                                .font(.title2)
                                                .foregroundStyle(.black)
                                            
                                            Spacer()
                                            
                                            Image(systemName: "chevron.right")
                                                .padding(.trailing, 16)
                                                .foregroundStyle(Color(uiColor: .secondaryLabel))
                                        }
                                        .padding(.leading, 3.5)
                                        
                                        Divider()
                                    }
                                }
                            })
                            
                            Button(action: {
                                chapterName = "Vowel"
//                                isVowelPage.toggle()
                                isPresented.toggle()

                            }, label: {
                                HStack(alignment: .top, spacing: 11) {
                                    Text("ㅏ")
                                        .bold()
                                        .font(.body)
                                        .padding(.all, 4)
                                        .overlay(
                                            Circle()
                                                .stroke(lineWidth: 2)
                                        )
                                    
                                    VStack(spacing: 16) {
                                        HStack {
                                            Text("Vowel")
                                                .font(.title2)
                                                .foregroundStyle(.black)
                                            
                                            Spacer()
                                            
                                            Image(systemName: "chevron.right")
                                                .padding(.trailing, 16)
                                                .foregroundStyle(Color(uiColor: .secondaryLabel))
                                        }
                                        .padding(.leading, 3.5)
                                        
                                        Divider()
                                    }
                                }
                            })

                            Button(action: {
                                chapterName = "Batchim"
//                                isBatchimPage.toggle()
                                isPresented.toggle()
                            }, label: {
                                HStack(alignment: .top, spacing: 11) {
                                    ZStack {
                                            
                                            Text("ㄱ")
                                                .bold()
                                                .font(.body)
                                                .offset(y: 4)
                                                .overlay{
                                                    VStack {
                                                        Circle()
                                                            .stroke(style: StrokeStyle(lineWidth: 1, dash: [1,1]))
                                                            .frame(width: 7)
                                                            .offset(y: -5)
                                                        
                                                    }
                                                }

                                        
                                        Text("ㄱ")
                                            .foregroundStyle(.clear)
                                            .font(.body)
                                            .bold()
                                            .padding(.all, 4)
                                            .overlay(
                                                Circle()
                                                    .stroke(lineWidth: 2)
                                            )
                                    }
                                    
                                    
                                    VStack(spacing: 16) {
                                        HStack {
                                            Text("Batchim")
                                                .font(.title2)
                                                .foregroundStyle(.black)
                                            
                                            Spacer()
                                            
                                            Image(systemName: "chevron.right")
                                                .padding(.trailing, 16)
                                                .foregroundStyle(Color(uiColor: .secondaryLabel))
                                        }
                                        .padding(.leading, 3.5)
                                        
                                        Divider()
                                        
                                    }

                                }
                            })
                        }
                        .padding(.leading, 3)
                    }
                    .padding(.top, 8)
                    .padding(.leading, 16)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Common Mistakes")
                            .bold()
                            .font(.title2)
                        
                        
                        LazyVGrid(columns: [GridItem(.flexible(), spacing: 15), GridItem(.flexible(), spacing: 15)],spacing: 16) {
                            ForEach(mistakes, id:\.self) { mistake in
                                HangulCardView(onTapGesture: {}, hangulCard: mistake, cardType: .medium)
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                }
            }
            .navigationTitle("Collection")
            .navigationDestination(isPresented: $isPresented, destination: {
                CollectionDetailView(chapterName: $chapterName)
            })
//            .navigationDestination(isPresented: $isVowelPage, destination: {
//                CollectionDetailView(chapterName: $chapterName)
//            })
//            .navigationDestination(isPresented: $isConsonantPage, destination: {
//                CollectionDetailView(chapterName: $chapterName)
//            })
            .scrollIndicators(.hidden)
        }
        .onAppear {
            let sortedDict = educationManager.wrongCount.sorted { (first, second) in
                if Int(first.value) == Int(second.value) {
                    return first.key < second.key
                }
                
                return Int(first.value)! > Int(second.value)!
            }
            
            for i in 0 ..< sortedDict.count {
                mistakes.append(HangulCard(name: sortedDict[i].key))
            }
        }
    }
    
}

#Preview {
    CollectionView()
        .environmentObject(EducationManager())
}
