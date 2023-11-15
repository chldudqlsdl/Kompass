//
//  Lesson.swift
//  Orum
//
//  Created by 차차 on 11/6/23.
//

import SwiftUI

extension String {
    func toEnum() -> LessonState {
        let result: LessonState
        
        switch self {
        case "locked":
                result = .locked
        case "currentLesson":
            result = .currentLesson
        case "complete":
            result = .complete
        default:
            result = .locked
        }
        
        return result
    }
}

struct Lesson: View {
    let action: () -> ()
        
    @EnvironmentObject var educationManager: EducationManager
    
    var chapterIndex: Int
    var lessonIndex: Int
    
    var lessonName: String {
        let index: Int
        
        switch chapterIndex {
        case 0:
            index = 0 // 0
        case 1:
            index = 1 + lessonIndex // 1,2,3,4,5,6
        case 2:
            index = 7 + lessonIndex // 7,8,9,10,11
        case 3:
            index = 12 + lessonIndex // 12,13,14,15
        default:
            index = 0
        }
        
        return Constants.Lesson.lessons[index]
    }
    
    var isButtonLocked: Bool {
        switch educationManager.lessonState[lessonName]?.toEnum() ?? .locked {
            case .locked:
            true
        case .complete,.currentLesson:
            false
        }
    }
    
    var body: some View {
        Button(action: {
            educationManager.createContent(lessonName: lessonName)
            educationManager.nowStudying = lessonName
            action()
        })
        {
            switch educationManager.lessonState[lessonName]?.toEnum() ?? .locked {
            case .locked:
                VStack {
                    HStack {
                        Text("\(Image(systemName: "lock.fill"))  \(lessonName) \n")
                            .bold()
                            .font(.title2)
                            .foregroundStyle(.secondary)
                        
                        Spacer()
                    }
                    .padding(.vertical, 10)
                    .padding(.leading, 16)
                }
                .background(RoundedRectangle(cornerRadius: 16)
                    .foregroundStyle(.quaternary))
                
            case .currentLesson:
                VStack {
                    VStack(alignment: .leading, spacing: 8) {
                        VStack(alignment: .leading) {
                            Text("\(lessonName)")
                                .bold()
                                .font(.title2)
                                .foregroundStyle(.white)
                            
                            Text("\(Constants.Lesson.lessonComponent[chapterIndex][lessonIndex].concatArray())")
                                .bold()
                                .font(.body)
                                .foregroundStyle(.white).opacity(0.4)
                        }
                        .padding(.vertical, 12)
                        .padding(.horizontal, 16)
                        
                        HStack {
                            Text("\(Image(systemName: "play.circle.fill")) Current Lesson")
                                .bold()
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                            
                            Spacer()
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(16, corners: [.bottomLeft, .bottomRight])
                    }
                    
                }
                .background(RoundedRectangle(cornerRadius: 16)
                    .foregroundStyle(Color.accentColor))
                
            case .complete:
                VStack {
                    VStack(spacing: 8) {
                        HStack {
                            Text("\(lessonName)")
                            
                            Spacer()
                            
                            Image(systemName: "checkmark.seal.fill")
                        }
                        .bold()
                        .font(.title2)
                        .foregroundStyle(.white)
                        
                        HStack {
                            Text("\(Constants.Lesson.lessonComponent[chapterIndex][lessonIndex].concatArray())")
                            
                            Spacer()
                            
                            Text(educationManager.completedDates[lessonName] ?? "")
                        }
                        .bold()
                        .font(.body)
                        .foregroundStyle(.white).opacity(0.4)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    
                }
                .background(RoundedRectangle(cornerRadius: 16)
                    .foregroundStyle(Color.accentColor))
            }
        }
//        .disabled(isButtonLocked)
    }
}

#Preview {
    Lesson(action: {}, chapterIndex: 0, lessonIndex: 0)
        .environmentObject(EducationManager())
}
