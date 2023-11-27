//
//  PracticeView.swift
//  Orum
//
//  Created by 차차 on 11/15/23.
//

import SwiftUI

struct PracticeView: View {
    
    @EnvironmentObject var practiceManager : PracticeManager
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack(spacing: 8) {
                    ForEach(0 ..< Constants.Practice.chapter.count) { index in
                        NavigationLink {
                            PracticeChapterView()
                                .environmentObject(practiceManager)
                                .onAppear{
                                    if !practiceManager.practicedChapters.contains(Constants.Practice.chapter[index]) {
                                        practiceManager.practicedChapters.append(Constants.Practice.chapter[index])
                                    }
                                    practiceManager.chapterIndex = index
                                }
                        } label: {
                            HStack(alignment: .top, spacing: 0) {
                                
                                Image("Thumbnail_\(Constants.Practice.thumbnail[Constants.Practice.chapter[index]]!)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 102, height: 57)
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                                    .padding(.trailing, 7)
                                    
                                    
                                VStack(spacing: 8) {
                                    HStack {
                                        VStack(alignment: .leading, spacing: 0) {
                                            HStack {
                                                Text("\(Constants.Practice.chapter[index])")
                                                    .bold()

                                                if !practiceManager.practicedChapters.contains(Constants.Practice.chapter[index]) {
                                                    Circle()
                                                        .frame(width: 7, height:7)
                                                        .foregroundStyle(.blue)
                                                }
                                            }
                                            .padding(.top, 4) // MARK: Padding .top, 4???
                                            
                                            Spacer()
                                        }
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.right")
                                            .foregroundStyle(.quaternary)
                                            .padding(.trailing, 16)
                                    }
                                    .padding(.leading, 9)
                                    .frame(height: 57)
                                    
                                    Divider()
                                }
                            }
                            .contentShape(Rectangle())
                            .frame(height: 65)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.leading, 15)
                
            }
            .navigationTitle("Practice")
        }
    }
}

#Preview {
    PracticeView()
        .environmentObject(PracticeManager())
}
