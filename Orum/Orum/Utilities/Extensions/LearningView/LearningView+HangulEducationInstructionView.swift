//
//  LearningView+HangulEducationInstructionView.swift
//  Orum
//
//  Created by 차차 on 11/21/23.
//

import SwiftUI

extension LearningView {
    
    @ViewBuilder
    func HangulEducationInstructionView(lesson: Lesson) -> some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    ZStack {
                        ThumbnailView(lesson: lesson)
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                        
                        VStack {
                            Spacer()
                            
                            Text("Preview")
                                .bold()
                                .foregroundStyle(Color(UIColor(hex: "EBEBF5")).opacity(0.6))
                            
                            Text("Before Lesson")
                                .font(.largeTitle)
                                .bold()
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, 16)
                        .opacity(isPresented ? 1 : 0)
                    }
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                    
                    VStack(spacing: 16) {
                        switch lesson.lessonType {
                        case .prologue:
                            Spacer()
                            
                        case .lesson:
                            VStack(spacing: 16) {
                                Text("\(Constants.Lesson.lessonComponent[lesson.lessonName]!.concatArray(isComma: false))")
                                    .frame(maxWidth: .infinity)
                                    .font(.custom("Pretendard-Bold", size: 34, relativeTo: .largeTitle))  // MARK: relativeTo: .largeTitle 이거 맞나?
                                    .bold()
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 48)
                                    .background(
                                        RoundedRectangle(cornerRadius: 16)
                                            .foregroundStyle(Color(uiColor: .secondarySystemFill))
                                    )
                                
                                
                                Text(Constants.Lesson.instructionText[lesson.lessonName] ?? "")
                                    .font(.title2)
                                
                                Spacer()
                                    .frame(height: 100)
                            }
                            .padding(.horizontal, 32)
                            .padding(.top, 32)
                            
                        case .epilogue:
                            Text(Constants.Lesson.instructionText[lesson.lessonName] ?? "")
                                .bold()
                                .font(.title2)
                                .padding(.horizontal, 32)
                            
                            VStack {
                                switch lesson.chapterType {
                                case .system:
                                    EmptyView()
                                    
                                case .consonant:
                                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 16),GridItem(.flexible(), spacing: 16)],spacing: 16, content: {
                                        ForEach(Constants.Hangul.consonants, id: \.self) { consonant in
                                            HangulCardView(onTapGesture: {}, hangulCard: HangulCard(name: consonant), cardType: .medium, canBorderColorChange: false)
                                        }
                                    })
                                    
                                case .vowel:
                                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 16),GridItem(.flexible(), spacing: 16)],spacing: 16, content: {
                                        ForEach(Constants.Hangul.vowels, id: \.self) { vowel in
                                            HangulCardView(onTapGesture: {}, hangulCard: HangulCard(name: vowel), cardType: .medium, canBorderColorChange: false)
                                        }
                                    })
                                    
                                case.batchim:
                                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 16),GridItem(.flexible(), spacing: 16)],spacing: 16, content: {
                                        ForEach(Constants.Hangul.batchim, id: \.self) { batchim in
                                            HangulCardView(onTapGesture: {}, hangulCard: HangulCard(name: batchim), cardType: .medium, canBorderColorChange: false)
                                        }
                                    })
                                }
                            }
                            .padding(.horizontal, 16)
                        }
                    }
                    .transition(.move(edge: .top))
                }
                .offset(y: scrollOffset > 0 ? -scrollOffset : 0)
                .overlay {
                    GeometryReader { proxy in
                        let minY = proxy.frame(in: .named("SCROLL_INSTRUCTION")).minY
                        Color.clear
                            .preference(key: OffsetKey.self, value: minY)
                    }
                    .onPreferenceChange(OffsetKey.self) { value in
                        scrollOffset = value
                    }
                }
            }
            .coordinateSpace(name: "SCROLL_INSTRUCTION")
            .overlay(alignment: .topLeading) {
                Button(action: {
                        withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7).delay(0.05)) {
                            currentLesson = nil
                            isPresented = false
                        }

                        withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                            animateView = false
                        } 
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title)
                        .foregroundStyle(.white, Color(uiColor:.systemFill))
                        .opacity(animateView ? 1 : 0)
                })
                .padding()
                .padding(.top, safeArea().top)
            }
            .onAppear {
                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7)) {
                    animateView = true
                }
            }
            .transition(.identity)
            
            VStack {
                Spacer()
                
                ZStack{
                    Rectangle()
                        .foregroundStyle(.ultraThinMaterial)
                    
                    VStack(spacing: 0){
                        
                        Button(action: {
                            withAnimation {
                                isLessonStart = true
                            }
                        completion: {
                            withAnimation(.default.delay(0.5)) {
                                currentLesson = nil
                                isPresented = false
                            }
                        }
                        },label: {
                            Text("Continue")
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 8)
                                .bold()
                        })
                        .buttonStyle(.borderedProminent)
                        .padding(.horizontal, 24)
                        .padding(.top, 24)
                        .padding(.bottom, 48)
                    }
                }
                .frame(height: animateView ? 122 : 0)
            }
            .ignoresSafeArea(edges: .bottom)
            .opacity(animateView ? 1 : 0)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                    withAnimation(.linear.delay(1)) {
                        navigationHidden.toggle()
                    }
                })

            }
            .onDisappear() {
                withAnimation {
                    navigationHidden.toggle()
                }
            }
        }
        .transition(.opacity)
        .toolbar(navigationHidden ? .hidden : .visible, for: .navigationBar)
    }
}
