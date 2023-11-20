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
    @State private var isPresented = false
    @EnvironmentObject var practiceManager : PracticeManager
    
    var body: some View {
        VStack(spacing: 0){
            Divider()
            ScrollView{
                VStack{
                    ForEach(0 ..< (Constants.Practice.lesson[chapterName]?.count)!) { index in
                        Button {
                            isPresented = true
                            practiceManager.lessonIndex = index
                        } label: {
                            HStack(alignment: .center, spacing: 0) {
                                VStack{
                                    Image(systemName: "square.dashed")
                                        .font(.largeTitle)
                                        .foregroundColor(practiceManager.practicedLessons.contains((Constants.Practice.lesson[chapterName]?[index])!) ? .clear : .blue)
                                }
                                VStack{
                                    Spacer()
                                    HStack {
                                        VStack(alignment: .leading) {
                                            HStack {
                                                Text("\((Constants.Practice.lesson[chapterName]?[index])!)")
                                            }
                                        }
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .foregroundStyle(.quaternary)
                                            .padding(.trailing, 16)
                                    }
                                    .padding(.leading, 9)
                                    Spacer()
                                    
                                    Divider()
                                        .padding(.leading, 10)
                                }
                            }
                            .contentShape(Rectangle())
                            .frame(height: 60)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.leading)
            }
            .navigationTitle(chapterName)
            .toolbarTitleDisplayMode(.inline)
            .fullScreenCover(isPresented: $isPresented, content: {
                PracticeLessonView(isPresented: $isPresented)
            })
        }
    }
}

#Preview {
    PracticeChapterView()
        .environmentObject(PracticeManager())
}
