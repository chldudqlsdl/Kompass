//
//  LearnView.swift
//  Orum
//
//  Created by 차차 on 10/31/23.
//

import SwiftUI


struct LearningView: View {
    @EnvironmentObject var educationManager: EducationManager
    @Environment(\.colorScheme) private var colorScheme : ColorScheme
    
    @State var currentLesson: Lesson?
    @State var animateView: Bool = false
    @State var scrollOffset: CGFloat = 0
    @State var isPresented = false
    @State var prologue = false
    @State var isLessonStart = false
    @State var navigationHidden = false
    
    @Namespace var animation
    
    let chapterName = [
        "한글 (Hangul)",
        "자음 (Consonant)",
        "모음 (Vowel)",
        "받침 (Batchim)",
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading,spacing: 16) {
                    ForEach (0 ..< 4) { index in
                        VStack(alignment: .leading) {
                            Text(chapterName[index])
                                .bold()
                                .font(.custom("Pretendard-Bold", size: 22, relativeTo: .title2))
                            
                            ForEach(lessons[index]) { lesson in
                                LessonView(lesson: lesson)
                            }
                        }
                        
                    }
                }
                .padding(.leading, 15)
                .frame(maxWidth: .infinity)
                .overlay {
                    GeometryReader { proxy in
                        let minY = proxy.frame(in: .named("SCROLL_LEARNINGVIEW")).minY
                        Color.clear
                            .preference(key: OffsetKey.self, value: minY)
                    }
                    .onPreferenceChange(OffsetKey.self) { value in
                        scrollOffset = value
                    }
                }
            }
            .coordinateSpace(name: "SCROLL_LEARNINGVIEW")
            .navigationTitle("Learn")
            .toolbar (scrollOffset < 0 && isPresented ? .hidden : .visible, for: .navigationBar)
            .navigationBarColor(backgroundColor: .clear, titleColor: colorScheme == .dark ? .white : UIColor(hex: "242321"))
            .navigationDestination(isPresented: $isLessonStart, destination: {
                HangulEducationView(isPresented: $isLessonStart)
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarBackButtonHidden(true)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            if educationManager.lessonType != .prologue {
                                Button(action: {
                                    isLessonStart.toggle()
                                    educationManager.index = 0
                                    educationManager.currentEducation = .learning
                                }, label: {
                                    Image(systemName: "xmark.circle.fill")
                                        .font(.title3)
                                        .foregroundStyle(.blue, Color(uiColor: .quaternarySystemFill))
                                })
                            }

                        }
                    }
            })
            .overlay {
                if let currentLesson = currentLesson, isPresented {
                    HangulEducationInstructionView(lesson: currentLesson)
                        .ignoresSafeArea(.container, edges: .top)
                }
            }
        }
        .toolbar(isPresented || isLessonStart ? .hidden : .visible, for: .tabBar)
    }
}


#Preview {
    LearningView()
        .environmentObject(EducationManager())
}
