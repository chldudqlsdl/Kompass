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
    @State var isConsonantPage = false
    @State var isVowelPage = false
    @State var cardViewTitle = "Common Mistakes"
    @State var isCanvasOpened = false
    @State var isWrited: Bool = false
    @State var mistakes: [HangulCard] = []
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Button(action: {
                        chapterName = "Consonant"
                        isConsonantPage.toggle()
                    }, label: {
                        HStack(alignment: .top, spacing: 14.5) {
                            Circle()
                                .stroke(Color.accentColor, lineWidth: 2)
                                .frame(width: 23, height: 23)
                                .overlay(Text("ㄱ")
                                    .bold()
                                    .font(.body))
                                .foregroundStyle(Color.accentColor)
                            
                            
                            VStack {
                                HStack {
                                    Text("Consonant")
                                        .font(.title2)
                                        .foregroundStyle(.black)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .padding(.trailing, 16)
                                        .foregroundStyle(Color(uiColor: .secondaryLabel))
                                }
                                
                                Divider()
                            }
                        }
                    })
                    
                    Button(action: {
                        chapterName = "Vowel"
                        isVowelPage.toggle()
                    }, label: {
                        HStack(alignment: .top, spacing: 14.5) {
                            Circle()
                                .stroke(Color.accentColor, lineWidth: 2)
                                .frame(width: 23, height: 23)
                                .overlay(Text("ㅏ")
                                    .bold()
                                    .font(.body))
                                .foregroundStyle(Color.accentColor)
                            
                            VStack {
                                HStack {
                                    Text("Vowel")
                                        .font(.title2)
                                        .foregroundStyle(.black)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .padding(.trailing, 16)
                                        .foregroundStyle(Color(uiColor: .secondaryLabel))
                                }
                                
                                Divider()
                            }
                        }
                    })
                    
                    Text("\(cardViewTitle)")
                        .bold()
                        .font(.title2)
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())],spacing: 16) {
                        ForEach(mistakes, id:\.self) { mistake in
                            VStack(alignment: .leading, spacing: 10) {
                                HangulCardView(onTapGesture: {}, hangulCard: mistake, cardType: .small)
                            }
                        }
                    }
                    .padding(.trailing, 16)
                }
                .padding(.leading, 16)
            }
            .navigationTitle("Collection")
            .navigationDestination(isPresented: $isConsonantPage, destination: {
                CollectionDetailView(chapterName: $chapterName)
            })
            .navigationDestination(isPresented: $isVowelPage, destination: {
                CollectionDetailView(chapterName: $chapterName)
            })
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
