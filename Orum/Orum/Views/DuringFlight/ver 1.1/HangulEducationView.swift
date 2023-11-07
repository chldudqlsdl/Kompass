//
//  HangulEducationView.swift
//  Orum
//
//  Created by 차차 on 10/31/23.
//

import SwiftUI

struct HangulEducationView: View {
    
    @Binding var isPresented: Bool
    @State var currentEducation: CurrentEducation = .onboarding
    @State var content: HangulUnit
    @State var quizContent: HangulUnit
    @State var progressValue : Int = 0
    @State var touchCardsCount : Int = 0
    @State var isOnceFlipped : Bool = false
    @State var isExample1Listened : Bool = false
    @State var isExample2Listened : Bool = false
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
                        ProgressView(value: Double(progressValue) / Double(content.hangulCards.count * 3))
                    }
                    .padding(16)
                    Divider()
                    switch currentEducation {
                    case .onboarding:
                        HangulEducationOnboardingView()
                            .padding(16)
                    case .learning:
                        HangulEducationLearningView(content: $content, touchCardsCount: $touchCardsCount, isOnceFlipped: $isOnceFlipped, isFlipped: $isFlipped, isExample1Listened: $isExample1Listened, isExample2Listened: $isExample2Listened)
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                            .transition(.opacity)
                    case .recap:
                        ZStack{
                            HangulEducationRecapView(content: $content)
                                .padding(.horizontal, 16)
                                
                            VStack{
                                Spacer()
                                Button {
                                    progressValue += 1
                                    currentEducation = .quiz
                                } label: {
                                    HStack{
                                        Spacer()
                                        Text("Ready to Quiz")
                                        Spacer()
                                    }
                                    .padding(.vertical, 5)
                                }
                                .buttonStyle(.borderedProminent)
                                .padding(EdgeInsets(top: 16, leading: 16, bottom: 50, trailing: 16))
                                .background(
                                    LinearGradient(gradient: Gradient(colors: [Color(uiColor: .systemBackground).opacity(0.0), Color(uiColor: .systemBackground).opacity(1.0)]), startPoint: .top, endPoint: .bottom)
                                )
                            }
                        }
                    case .quiz:
                        HangulEducationQuizView(content: $quizContent, isOptionSelected: $isOptionSelected, isOptionSubmitted: $isOptionSubmitted, isOptionWrong: $isOptionWrong)
                            .padding(16)
                            .transition(.opacity)
                        
                    }
                    
                    switch currentEducation {
                    case .onboarding:
                        Spacer()
                        VStack{
                            Button(action: {
                                currentEducation = .learning
                                progressValue += 1
                            }){
                                HStack{
                                    Spacer()
                                    Text("Continue")
                                    Spacer()
                                }
                                .padding(.vertical, 5)
                            }
                            .buttonStyle(.borderedProminent)
                        }
                        .padding(EdgeInsets(top: 16, leading: 16, bottom: 50, trailing: 16))
                    case .learning:
                        Spacer()
                        ZStack{
                            VStack(spacing: 0){
                                if (content.unitIndex == 0 && isOnceFlipped && isExample1Listened && isExample2Listened){
                                    VStack{
                                        Rectangle()
                                            .frame(height: 5)
                                            .foregroundColor(.blue)
                                        VStack(alignment: .leading, spacing: 16){
                                            HStack{
                                                Image(systemName: "info.circle.fill")
                                                    .font(.title2)
                                                    .foregroundColor(.blue)
                                                Text("info")
                                                    .font(.title2)
                                                    .fontWeight(.bold)
                                                    .foregroundColor(.blue)
                                            }
                                            Text("\(content.hangulCards[content.unitIndex].name ) has a similar shape and [\(content.hangulCards[content.unitIndex].sound)] sound of \(content.hangulCards[content.unitIndex].lottieName).")
                                                .fontWeight(.bold)
                                                .foregroundColor(.blue)
                                        }
                                    }
                                }
                                VStack{
                                    Button(action: {
                                        if  content.unitIndex < content.hangulCards.count - 1 {
                                            content.unitIndex += 1
                                            progressValue += 1
                                        } else {
                                            withAnimation(.easeIn(duration: 1)) {
                                                content.unitIndex = 0
                                                progressValue += 1
                                                currentEducation = .recap
                                            }
                                        }
                                        withAnimation (.easeIn(duration: 1)){
                                            isOnceFlipped = false
                                            isFlipped = false
                                            isExample1Listened = false
                                            isExample2Listened = false
                                            touchCardsCount = 0
                                        }
                                    }){
                                        HStack{
                                            Spacer()
                                            Text("Continue")
                                            Spacer()
                                        }
                                        .padding(.vertical, 5)
                                    }
                                    .buttonStyle(.borderedProminent)
                                    .disabled(!isOnceFlipped || !isExample1Listened || !isExample2Listened)
                                }
                                .padding(EdgeInsets(top: 16, leading: 16, bottom: 50, trailing: 16))
                            }
                        }
                        .background((content.unitIndex == 0 && isOnceFlipped && isExample1Listened && isExample2Listened) ? .blue.opacity(0.05) : .clear)
                    case .recap:
                        EmptyView()
                            .padding(EdgeInsets(top: 16, leading: 16, bottom: 50, trailing: 16))
                    case .quiz:
                        Spacer()
                        ZStack{
                            VStack(spacing: 0){
                                if (isOptionSubmitted ){
                                    VStack{
                                        Rectangle()
                                            .frame(height: 5)
                                            .foregroundColor(isOptionWrong ? .red : .blue)
                                        VStack(alignment: .leading, spacing: 16){
                                            HStack{
                                                Image(systemName: isOptionWrong ? "exclamationmark.circle.fill" : "checkmark.circle.fill")
                                                    .font(.title2)
                                                    .foregroundColor(isOptionWrong ? .red : .blue)
                                                Text(isOptionWrong ? "Incorrect" : "Correct")
                                                    .font(.title2)
                                                    .fontWeight(.bold)
                                                    .foregroundColor(isOptionWrong ? .red : .blue)
                                            }
                                            Text( isOptionWrong ? "ㄱ has a similar shape and [g] sound of gun." : "감사합니다[gamsahabnida] means “Thank you” in Korean.")
                                                .fontWeight(.bold)
                                                .foregroundColor(isOptionWrong ? .red : .blue)
                                        }
                                    }
                                }
                                VStack{
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
                                }
                                .padding(EdgeInsets(top: 16, leading: 16, bottom: 50, trailing: 16))
                            }
                        }
                        .background(
                            correctionBackground()
                        )

                    }
                }
                .navigationTitle(content.unitName)
                .navigationBarTitleDisplayMode(.automatic)
                .navigationBarItems(leading: Button(action: {
                    isPresented.toggle()
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(.blue, Color(uiColor: .systemGray4))
                        .symbolRenderingMode(.palette)
                })
            }
            .edgesIgnoringSafeArea([.bottom])
        }
    }
    
    func correctionBackground() -> Color {
        if isOptionSubmitted && !isOptionWrong {
            Color.blue.opacity(0.05)
        }
        else if isOptionSubmitted && isOptionWrong {
            Color.red.opacity(0.05)
        } else {
            Color.clear
        }
    }
}

enum CurrentEducation {
    case onboarding
    case learning
    case recap
    case quiz
}

#Preview {
    HangulEducationView(isPresented: .constant(true), content: HangulUnit(unitName: "Consonants1", unitIndex: 0, hangulCards: HangulCard.preview), quizContent: HangulUnit(unitName: "Consonants1", unitIndex: 0, hangulCards: HangulCard.preview))
}
