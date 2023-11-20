//
//  PracticeLessonView.swift
//  Orum
//
//  Created by Youngbin Choi on 11/16/23.
//

import SwiftUI

struct PracticeLessonView: View {
    
    var chapterIndex: Int {
        practiceManager.chapterIndex
    }
    var chapterName: String {
            Constants.Practice.chapter[chapterIndex]
        }
    var lessonIndex: Int {
        practiceManager.lessonIndex
    }
    var lessonName: String {
        Constants.Practice.lesson[chapterName]?[lessonIndex] ?? ""
    }
    
    @StateObject var audioRecorderManager = AudioRecorderManager()
    @Binding var isPresented: Bool
    @EnvironmentObject var practiceManager : PracticeManager
    
    
    var body: some View {
        NavigationView{
            VStack(spacing : 0){
                ScrollView{
                    VStack(spacing: 100){
                        VStack{
                            Text("Listen Hangul and unlock the explanation")
                                .font(.title2)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                            ZStack{
                                if practiceManager.practicedLessons.contains(lessonName) {
                                    Image(lessonName)
                                        .resizable()
                                        .scaledToFit()
                                } else{
                                    Image(systemName: "lock.fill")
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(uiColor: .systemBackground))
                                }
                            }
                            .frame(maxWidth: .infinity, minHeight: 200, maxHeight: 200)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(Color(uiColor: .systemGray6))
                            )
                        }
                        .padding(.top, 10)
                        
                        HStack{
                            Button(action: {
                                if practiceManager.lessonIndex == 0 {
                                    practiceManager.lessonIndex = Constants.Practice.lesson[chapterName]!.count - 1
                                } else {
                                    practiceManager.lessonIndex -= 1
                                }
                            }, label: {
                                Image(systemName: "chevron.compact.left")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(uiColor: .systemGray4))
                            })
                            Spacer()
                            Button(action: {
                                practiceManager.practicedLessons.append(lessonName)
                            }, label: {
                                VStack{
                                    Image(systemName: "speaker.wave.2.fill")
                                        .font(.footnote)
                                        .foregroundColor(Color(uiColor: .systemBackground))
                                    Text(lessonName)
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(uiColor: .systemBackground))
                                }
                                .padding(EdgeInsets(top: 12, leading: 35, bottom: 12, trailing: 35))
                                .background(
                                    Capsule()
                                )
                            })
                            Spacer()
                            Button(action: {
                                withAnimation(.easeIn(duration: 1)){
                                    if practiceManager.lessonIndex == Constants.Practice.lesson[chapterName]!.count - 1 {
                                        practiceManager.lessonIndex = 0
                                    } else {
                                        practiceManager.lessonIndex += 1
                                    }
                                }
                            }, label: {
                                Image(systemName: "chevron.compact.right")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(uiColor: .systemGray4))
                            })
                        }
                    }
                    .padding(.horizontal, 16)

                }
                .navigationBarItems(leading: Button(action: {
                    isPresented.toggle()
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title3)
                        .foregroundStyle(.blue, Color(uiColor: .secondarySystemFill))
                }))
            }
        }
    }
}

#Preview {
    PracticeLessonView(isPresented: .constant(false))
        .environmentObject(PracticeManager())
}
