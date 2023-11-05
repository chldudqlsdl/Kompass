//
//  HangulEducationView.swift
//  Orum
//
//  Created by 차차 on 10/31/23.
//

import SwiftUI

struct HangulEducationView: View {
    
    @Binding var isPresented: Bool
    @State var currentEducation: CurrentEducation = .learning
    @State var content: HangulUnit
    @State var quizContent: HangulUnit
    @State var progressValue : Int = 0
    @State var isOnceFlipped : Bool = false
    @State var isFlipped: Bool = false
    
    @State var isOptionSelected : Bool = false
    @State var isOptionSubmitted : Bool = false
    @State var isOptionWrong : Bool =  false
    @State var quizButtonText : String = "Check"
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0){
                    VStack{
                        ProgressView(value: Double(progressValue) / Double(content.hangulCards.count * 3 - 1))
                            
                    }
                    .padding(16)
                    
                    Divider()
                    
                    switch currentEducation {
                    case .learning:
                        HangulEducationLearningView(content: $content, isOnceFlipped: $isOnceFlipped, isFlipped: $isFlipped)
                            .padding(16)
                            .transition(.opacity)
                    case .quiz:
                        HangulEducationQuizView(content: $quizContent, isOptionSelected: $isOptionSelected, isOptionSubmitted: $isOptionSubmitted, isOptionWrong: $isOptionWrong)
                            .padding(16)
                    case .recap:
                        HangulEducationRecapView()
                            .padding(16)
                    }
                    
                    Spacer()
                    VStack{
                        switch currentEducation {
                        case .learning:
                            Button(action: {
                                if  content.unitIndex < content.hangulCards.count - 1 {
                                        content.unitIndex += 1
                                    progressValue += 1
                                } else {
                                    withAnimation(.easeIn(duration: 1)) {
                                        content.unitIndex = 0
                                        progressValue += 1
                                        currentEducation = .quiz
                                    }
                                }
                                isOnceFlipped = false
                                isFlipped = false
                            }){
                                HStack{
                                    Spacer()
                                    Text("Got it!")
                                    Spacer()
                                }
                                .padding(.vertical, 5)
                            }
                            .buttonStyle(.borderedProminent)
                            .disabled(!isOnceFlipped)
                        case .quiz:
                            Button(action: {
                                if quizButtonText == "Check" {
                                    isOptionSubmitted = true
                                    quizButtonText = "Got it"
                                    return
                                }
                                if  quizContent.unitIndex < quizContent.hangulCards.count - 1 {
                                    if isOptionWrong {
                                        quizContent.hangulCards.append(quizContent.hangulCards[quizContent.unitIndex])
                                    } else {
                                        progressValue += 1
                                    }
                                    quizContent.unitIndex += 1
                                    quizButtonText = "Check"
                                    isOptionSelected = false
                                    isOptionSubmitted = false
                                    isOptionWrong = false
                                }
                                else {
                                    withAnimation(.easeIn(duration: 1)) {
                                        currentEducation = .recap
                                        progressValue += 1
                                    }
                                }
                            }){
                                HStack{
                                    Spacer()
                                    Text(quizButtonText)
                                    Spacer()
                                }
                                .padding(.vertical, 5)
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(!isOptionWrong ? .blue : .red)
                            .disabled(!isOptionSelected)
                        case .recap:
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                            })
                        }
                    }
                    .padding(16)
                    
                }
                .navigationTitle(content.unitName)
                .navigationBarItems(leading: Button(action: {
                    isPresented.toggle()
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(.blue, Color(uiColor: .systemGray4))
                        .symbolRenderingMode(.palette)
                })
            }
        }
    }
}

enum CurrentEducation {
    case learning
    case quiz
    case recap
}

#Preview {
    HangulEducationView(isPresented: .constant(true), content: HangulUnit(unitName: "Consonants1", unitIndex: 0, hangulCards: HangulCard.preview), quizContent: HangulUnit(unitName: "Consonants1", unitIndex: 0, hangulCards: HangulCard.preview))
}
