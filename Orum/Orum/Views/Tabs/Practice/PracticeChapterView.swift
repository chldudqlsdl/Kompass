//
//  PracticeChapterView.swift
//  Orum
//
//  Created by Youngbin Choi on 11/16/23.
//

import SwiftUI

struct PracticeChapterView: View {
    
    var chapterIndex: Int {
        practiceManager.chapterIndex
    }
    var chapterName: String {
        Constants.Practice.chapter[chapterIndex]
    }
    
    @EnvironmentObject var practiceManager : PracticeManager
    
    @State private var selectedWord: PracticeWord? = nil
    @Namespace private var animation
    
    var body: some View {
        VStack(spacing: 0){
            Divider()
            ScrollView{
                VStack{
                    VStack(alignment: .leading){
                        HStack{
                            Image(systemName: "lightbulb.fill")
                                .font(.body)
                                .foregroundColor(.yellow)
                            Text("Tip")
                                .bold()
                                .font(.body)
                            Spacer()
                        }
                        .padding(EdgeInsets(top: 16, leading: 16, bottom: 5, trailing: 16))
                        Divider()
                            .padding(.leading, 16)
                        Text("Touch the pronounce button and get the description of the word.")
                            .padding(EdgeInsets(top: 5, leading: 16, bottom: 16, trailing: 16))
                            .foregroundColor(Color(uiColor: .secondaryLabel))
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
                    .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
                    
                    VStack(spacing: 8) {
                    ForEach(practiceWords[chapterName]!) { practiceWord in
                        
                        if(practiceWord != selectedWord) {
                            Button(action: {
                                withAnimation {
                                    selectedWord = practiceWord
                                    practiceManager.practicedWords.append(practiceWord.name)
                                }
                            }, label: {
                                HStack(alignment: .center, spacing: 15) {
                                    RoundedRectangle(cornerRadius: 8)
                                        .strokeBorder(style: StrokeStyle(lineWidth: 3, dash: [5]))
                                        .foregroundColor( practiceManager.practicedWords.contains(practiceWord.name) ? .clear : Color(uiColor: .secondarySystemFill))
                                        .frame(width: 48, height: 48)
                                        .overlay{
                                            if practiceManager.practicedWords.contains(practiceWord.name) {
                                                Image("국밥")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .matchedGeometryEffect(id: practiceWord.image, in: animation)
                                            }
                                        }
                                    
                                    
                                    VStack(spacing: 0) {
                                        HStack(alignment: .center) {
                                            Text("\(practiceWord.name)")
                                                .bold()
                                                .font(.title2)
                                                .matchedGeometryEffect(id: practiceWord.id, in: animation)
                                            
                                            if practiceManager.practicedWords.contains(practiceWord.name) {
                                                Image(systemName: "chevron.down")
                                                    .font(.title2)
                                                    .foregroundStyle(.blue)
                                                    .matchedGeometryEffect(id: practiceWord.explanation, in: animation)
                                            }
                                            
                                            Spacer()
                                            
                                            Capsule()
                                                .frame(width: 57, height: 34)
                                                .foregroundStyle(Color(uiColor: .tertiarySystemFill))
                                                .overlay {
                                                    Image(systemName: "speaker.wave.2.fill")
                                                        .font(.body)
                                                        .foregroundStyle(.blue)
                                                }
                                                .padding(.trailing, 15)
                                        }
                                        .padding(.top, 7)
                                        .padding(.bottom, 15)
                                        
                                        
                                        Divider()
                                    }
                                }
                                .contentShape(Rectangle())
                            })
                            .buttonStyle(.plain)
                            .transition(.opacity)
                        }
                        else {
                            VStack(spacing: 0){
                                HStack(alignment: .center) {
                                    Text("\(practiceWord.name)")
                                        .bold()
                                        .font(.title2)
                                        .matchedGeometryEffect(id: practiceWord.id, in: animation)
                                    
                                    Button(action: {
                                        withAnimation {
                                            selectedWord = nil
                                        }
                                    }, label: {
                                        Image(systemName: "chevron.up")
                                            .font(.title2)
                                            .foregroundStyle(.blue)
                                            .matchedGeometryEffect(id: practiceWord.explanation, in: animation)
                                    })
                                    
                                    Spacer()
                                    
                                    Capsule()
                                        .frame(width: 57, height: 34)
                                        .foregroundStyle(Color(uiColor: .tertiarySystemFill))
                                        .overlay {
                                            Image(systemName: "waveform")
                                                .font(.body)
                                                .foregroundStyle(.blue)
                                        }
                                        .padding(.trailing)
                                }
                                .padding(.top, 7)
                                .padding(.bottom, 15)
                                
                                HStack {
                                    Text("\(practiceWord.explanation)")
                                        .foregroundStyle(Color(uiColor: .secondaryLabel))
                                    Spacer()
                                }
                                .padding(.bottom, 10)
                                
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundStyle(Color(uiColor: .quaternarySystemFill))
                                    .frame(height: 190)
                                    .padding(.trailing)
                                    .overlay {
                                        Image("국밥")
                                            .resizable()
                                            .scaledToFit()
                                            .matchedGeometryEffect(id: practiceWord.image, in: animation)
                                    }
                                
                                Divider()
                                    .padding(.top, 16)
                            }
                        }
                    }
                    .padding(.leading)
                }
                }
            }
            .navigationTitle(chapterName)
            .toolbarTitleDisplayMode(.inline)

        }
    }
}

#Preview {
    PracticeChapterView()
        .environmentObject(PracticeManager())
}
