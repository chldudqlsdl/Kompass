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
                VStack{
                    ForEach(0 ..< Constants.Practice.chapter.count) { index in
                        NavigationLink {
                            PracticeChapterView()
                                .environmentObject(practiceManager)
                                .onAppear{
                                    if !practiceManager.practicedChapters.contains(Constants.Practice.chapter[index]) {
                                        practiceManager.practicedChapters.append(Constants.Practice.chapter[index])
                                    }
                                }
                        } label: {
                            HStack(alignment: .top, spacing: 0) {
                                RoundedRectangle(cornerRadius: 4)
                                    .frame(maxWidth: 102, maxHeight: 57)
                                    .padding(.trailing, 7)
                                
                                VStack{
                                    HStack {
                                        VStack(alignment: .leading) {
                                            HStack {
                                                Text("\(Constants.Practice.chapter[index])")
                                                    .bold()
                                                if !practiceManager.practicedChapters.contains(Constants.Practice.chapter[index]) {
                                                    Circle()
                                                        .frame(width: 7, height:7)
                                                        .foregroundStyle(.blue)
                                                }
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
