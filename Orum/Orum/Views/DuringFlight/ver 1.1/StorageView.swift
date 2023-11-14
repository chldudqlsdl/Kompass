//
//  StorageView.swift
//  Orum
//
//  Created by 차차 on 11/09/23.
//

import SwiftUI

struct StorageView: View {
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
                    /*
                    ZStack {
                        if isCanvasOpened {
                            VStack {
                                HStack {
                                    Text("\(Image(systemName:"pencil.tip.crop.circle.fill")) Draw to Search")
                                        .bold()
                                        .font(.title2)
                                        .foregroundStyle(.secondary)
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        withAnimation {
                                            isCanvasOpened.toggle()
                                        }
                                    }, label: {
                                        Text("Cancel")
                                            .bold()
                                            .font(.title2)
                                    })
                                }
                                .padding(.top, 13)
                                .padding(.horizontal, 13)
                                
                                ZStack {
                                    CustomLineShapeWithAlignment(stratPoint: .topLeading, endPoint: .bottomLeading)
                                        .stroke(style: StrokeStyle(lineWidth: 1.0, dash: [5]))
                                        .frame(width: 1.0)
                                        .foregroundStyle(.secondary)

                                    
                                    CustomLineShapeWithAlignment(stratPoint: .leading, endPoint: .trailing)
                                        .stroke(style: StrokeStyle(lineWidth: 1.0, dash: [5]))
                                        .frame(height: 1.0)
                                        .foregroundStyle(.secondary)
                                }
                                .frame(height: 257)
                                .padding(.horizontal,52)
                                
                                
                                HStack {
                                    Spacer()
                                    if isWrited {
                                        Button(action: {},label: {
                                            Image(systemName:"arrow.clockwise")
                                                .bold()
                                                .font(.title2)
                                        })
                                    }
                                }
                                .padding(.horizontal, 13)
                                .padding(.bottom, 13)
                                
                            }
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(.quaternary.opacity(0.08)))
                            .padding(.trailing, 16)
                        }
                        
                        else {
                            VStack {
                                Button(action: {
                                    withAnimation {
                                        isCanvasOpened.toggle()
                                    }
                                }, label: {
                                    Text("\(Image(systemName:"pencil.tip.crop.circle.fill")) Draw to Search")
                                        .bold()
                                        .font(.title2)
                                        .frame(maxWidth: .infinity)
                                })
                                .buttonStyle(.bordered)
                                .padding(.trailing, 16)
                                
                                Divider()
                            }
                        }
                    }
                    */
                    
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
                    
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 15), GridItem(.flexible())],spacing: 16) {
                        ForEach(mistakes, id:\.self) { mistake in
                            VStack(alignment: .leading, spacing: 10) {
                                HangulCardView(onTapGesture: {}, hangulCard: mistake, isLearningView: false)
                            }
                        }
                    }
                    .padding(.trailing, 16)
                }
                .padding(.leading, 16)
            }
            .navigationTitle("Storage")
            .navigationDestination(isPresented: $isConsonantPage, destination: {
                StorageDetailView(chapterName: $chapterName)
            })
            .navigationDestination(isPresented: $isVowelPage, destination: {
                StorageDetailView(chapterName: $chapterName)
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
    StorageView()
        .environmentObject(EducationManager())
}
