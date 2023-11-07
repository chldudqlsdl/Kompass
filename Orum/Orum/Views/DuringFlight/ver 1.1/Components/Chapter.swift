//
//  Chapter.swift
//  Orum
//
//  Created by 차차 on 11/6/23.
//

import SwiftUI

extension String {
    func toEnum() -> ChapterState {
        let result: ChapterState
        
        switch self {
        case "locked":
                result = .locked
        case "currentSession":
            result = .currentSession
        case "complete":
            result = .complete
        default:
            result = .locked
        }
        
        return result
    }
}

struct Chapter: View {
    let action: () -> ()
        
    @EnvironmentObject var educationManager: EducationManager
    
    var categoryInd: Int
    var chapterInd: Int
    
    var chapterName: String {
        let ind: Int
        
        switch categoryInd {
        case 0:
            ind = 0
        case 1:
            ind = 1 + chapterInd
        case 2:
            ind = 2 * 3 + chapterInd
        default:
            ind = 0
        }
        
        return Constants.Chapter.chapters[ind]
    }
    
    var isButtonLocked: Bool {
        switch educationManager.chapterState[chapterName]!.toEnum() {
            case .locked:
            true
        case .complete,.currentSession:
            false
        }
    }
    
    var body: some View {
        Button(action: {
            educationManager.createContent(chapterName: chapterName)
            educationManager.nowStudying = chapterName
            action()
        })
        {
            switch educationManager.chapterState[chapterName]!.toEnum(){
            case .locked:
                VStack {
                    HStack {
                        Text("\(Image(systemName: "lock.fill"))  \(chapterName) \n")
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
                
            case .currentSession:
                VStack {
                    VStack(alignment: .leading, spacing: 8) {
                        VStack(alignment: .leading) {
                            Text("\(chapterName)")
                                .bold()
                                .font(.title2)
                                .foregroundStyle(.white)
                            
                            Text("\(Constants.Chapter.chapterComponent[categoryInd][chapterInd].concatArray())")
                                .bold()
                                .font(.body)
                                .foregroundStyle(.white).opacity(0.4)
                        }
                        .padding(.vertical, 12)
                        .padding(.horizontal, 16)
                        
                        HStack {
                            Text("\(Image(systemName: "play.circle.fill")) Current Session")
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
                            Text("\(chapterName)")
                            
                            Spacer()
                            
                            Image(systemName: "checkmark.seal.fill")
                        }
                        .bold()
                        .font(.title2)
                        .foregroundStyle(.white)
                        
                        HStack {
                            Text("\(Constants.Chapter.chapterComponent[categoryInd][chapterInd].concatArray())")
                            
                            Spacer()
                            
                            Text(educationManager.completedDates[chapterName] ?? "")
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
        .disabled(isButtonLocked)
        .onAppear{
            print("chapter appear")
        }
    }
}

#Preview {
    Chapter(action: {}, categoryInd: 0, chapterInd: 0)
        .environmentObject(EducationManager())
}
