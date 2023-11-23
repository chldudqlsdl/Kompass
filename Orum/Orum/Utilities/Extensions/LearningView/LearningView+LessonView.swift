//
//  LearningView+LessonView.swift
//  Orum
//
//  Created by 차차 on 11/21/23.
//

import SwiftUI

extension LearningView {
    @ViewBuilder
    func LessonView(lesson: Lesson) -> some View {        
        HStack(alignment: .top, spacing: 0) {
            ThumbnailView(lesson: lesson)
                .frame(width: 102, height: 57)
                .overlay(
                    Image(systemName: "lock.fill")
                        .foregroundStyle(.white)
                        .opacity(lesson.lessonState ==  "locked" ? 1 : 0)
                    
                )
                .padding(.trailing, 7)
                .onTapGesture {
                    
                    if  lesson.lessonState != "locked" {
                        educationManager.createContent(lessonName: lesson.lessonName)
                        educationManager.nowStudying = lesson.lessonName
                        
                        if educationManager.lessonType != .prologue {
                            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.75, blendDuration: 0)) {
                                currentLesson = lesson
                                isPresented = true
                            }
                            
                            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7).delay(0.5)) {
                                animateView = true
                            }
//                            completion: {
//                                navigationHidden = true
//                            }
                        }
                        else {
                            prologue = true
                        }
                    }
                }
            
            Button(action: {
                educationManager.createContent(lessonName: lesson.lessonName)
                educationManager.nowStudying = lesson.lessonName
                
                if educationManager.lessonType != .prologue {
                    withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0)) {
                        currentLesson = lesson
                        isPresented = true
                    }
                    
                    withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7).delay(0.5)) {
                        animateView = true
                    } 
//                completion: {
//                        navigationHidden = true
//                    }
                }
                else {
                    prologue = true
                }
            },label: {
                HStack(alignment: .top, spacing: 0) {
                    VStack {
                        HStack {
                            VStack(alignment: .leading, spacing: 0) {
                                HStack {
                                    Text(Constants.Lesson.lessonComponent[lesson.lessonName]!.concatArray())
                                        .bold()
                                        .font(.body)
                                    
                                    Circle()
                                        .frame(width: 7, height:7)
                                        .foregroundStyle(.blue)
                                        .opacity(lesson.lessonState == "currentLesson" ? 1 : 0)
                                }
                                
                                Text("\(lesson.completedDates)")
                                    .bold()
                                    .font(.footnote)
                                    .foregroundStyle(.quaternary)
                            }
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .font(.footnote)
                                .foregroundStyle(.quaternary)
                                .padding(.trailing, 16)
                        }
                        .padding(.leading, 9)
                        .padding(.bottom,25)
                        
                        
                        Divider()
                    }
                }
                .contentShape(Rectangle())
            })
            .disabled(lesson.lessonState ==  "locked")
            .buttonStyle(.plain)
            
        }
    }
}