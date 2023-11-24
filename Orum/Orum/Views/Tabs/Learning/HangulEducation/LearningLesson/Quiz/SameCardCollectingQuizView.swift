//
//  SameCardCollectingQuizView.swift
//  Orum
//
//  Created by 차차 on 11/8/23.
//

import SwiftUI

struct SameCardCollectingQuizView: View {
//    @Binding var currentEducation: CurrentEducation
    @Binding var progressValue: Int
    
    @State var firstTappedIndex : Int = 10
    @State var whichSideFirstTapped : String = ""
    @State var bothSideTapped : Bool = false
    @State var leftOptionVowels : [Character] = []
    @State var rightOptionVowels : [Character] = []
    @State var isLeftOptionTapped : [Bool] = [false, false, false, false]
    @State var isRightOptionTapped : [Bool] = [false, false, false, false]
    @State var isLeftOptionCorrect : [Bool] = [false, false, false, false]
    @State var isRightOptionCorrect : [Bool] = [false, false, false, false]
    @EnvironmentObject var educationManager: EducationManager
    
    var body: some View {
        ZStack{
            ScrollView{
                VStack(alignment: .leading ,  spacing: 32){
                    ProgressView(value: Double(progressValue) / Double(educationManager.content.count * 2 + 2))
                        .padding(.vertical, 16)
                    
                    Text("Select appropriate vowel of the sound")
                        .font(.title2)
                        .fontWeight(.bold)
                    HStack(spacing: 14){
                        VStack(spacing: 16){
                            ForEach(0 ..< leftOptionVowels.count, id: \.self ) { index in
                                Button(action: {
                                    if isLeftOptionCorrect[index] {
                                        return
                                    }
                                    if whichSideFirstTapped == ""{
                                        whichSideFirstTapped = "left"
                                        isLeftOptionTapped[index] = true
                                        firstTappedIndex = index
                                    } else if whichSideFirstTapped == "left"{
                                        for i in 0 ..< isLeftOptionTapped.count {
                                            isLeftOptionTapped[i] = false
                                        }
                                        firstTappedIndex = index
                                        isLeftOptionTapped[index] = true
                                    } else if whichSideFirstTapped == "right" {
                                        bothSideTapped = true
                                        isLeftOptionTapped[index] = true
                                        if leftOptionVowels[index] == rightOptionVowels[firstTappedIndex] {
                                            isLeftOptionCorrect[index] = true
                                            isRightOptionCorrect[firstTappedIndex] = true
                                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5 , execute: {
                                                leftOptionReset(index)
                                            })
                                        } else {
                                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5 , execute: {
                                                leftOptionReset(index)
                                            })
                                        }
                                    }
                                }, label: {
                                    Image(systemName: "speaker.wave.3.fill")
                                        .frame(maxWidth: .infinity)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(makeLeftColor(index)[0])
                                        .padding(.vertical, 24)
                                        .overlay(RoundedRectangle(cornerRadius: 24)
                                            .strokeBorder(makeLeftColor(index)[1], lineWidth: 8.0, antialiased: true))
                                })
                            }
                        }
                        VStack(spacing: 16){
                            ForEach(0 ..< rightOptionVowels.count, id: \.self ) { index in
                                Button(action: {
                                    if isRightOptionCorrect[index] {
                                        return
                                    }
                                    if whichSideFirstTapped == ""{
                                        whichSideFirstTapped = "right"
                                        isRightOptionTapped[index] = true
                                        firstTappedIndex = index
                                    } else if whichSideFirstTapped == "right"{
                                        for i in 0 ..< isRightOptionTapped.count {
                                            isRightOptionTapped[i] = false
                                        }
                                        firstTappedIndex = index
                                        isRightOptionTapped[index] = true
                                    } else if whichSideFirstTapped == "left" {
                                        bothSideTapped = true
                                        isRightOptionTapped[index] = true
                                        if rightOptionVowels[index] == leftOptionVowels[firstTappedIndex] {
                                            isRightOptionCorrect[index] = true
                                            isLeftOptionCorrect[firstTappedIndex] = true
                                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5 , execute: {
                                                rightOptionReset(index)
                                            })
                                        } else {
                                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5 , execute: {
                                                rightOptionReset(index)
                                            })
                                        }
                                    }
                                }, label: {
                                    Text("\(String(rightOptionVowels[index]))")
                                        .frame(maxWidth: .infinity)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(makeRightColor(index)[0])
                                        .padding(.vertical, 24)
                                        .overlay(RoundedRectangle(cornerRadius: 24)
                                            .strokeBorder(makeRightColor(index)[1], lineWidth: 8.0, antialiased: true))
                                })
                            }
                        }
                    }
                }
            }
            
            VStack {
                Spacer()
                
                Button(action: {
                    educationManager.currentEducation = .quiz
                    progressValue += 1
                }, label: {
                    Text("Continue")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                })
                    .buttonStyle(.borderedProminent)
            }
        }
        .onAppear {
            rightOptionVowels = makeOptions()
            leftOptionVowels = rightOptionVowels.shuffled()
        }
    }
    
    func makeOptions() -> [Character] {
        var learnedVowels: [Character] = []
        for i in 0 ..< educationManager.content.count {
            learnedVowels.append(contentsOf: educationManager.content[i].name)
        }
        let shuffledLearnedVowels = learnedVowels.shuffled()
        let optionVowels = shuffledLearnedVowels.prefix(4).shuffled()
        return optionVowels
    }
    
    func makeLeftColor( _ index : Int) -> [Color] {
        if isLeftOptionCorrect[index] {
            return [Color(uiColor: .quaternarySystemFill) , Color(uiColor: .quaternarySystemFill)]
        } else if isLeftOptionTapped[index] && bothSideTapped {
            return [Color(uiColor: .systemRed) , Color(uiColor: .systemRed)]
        }
        else if  isLeftOptionTapped[index]  {
            return [Color(uiColor: .systemBlue) , Color(uiColor: .systemBlue)]
        } else {
            return [Color(uiColor: .systemBlue) , Color(uiColor: .systemFill)]
        }
    }
    
    func makeRightColor( _ index : Int) -> [Color] {
        if isRightOptionCorrect[index] {
            return [Color(uiColor: .quaternarySystemFill) , Color(uiColor: .quaternarySystemFill)]
        } else if isRightOptionTapped[index] && bothSideTapped {
            return [Color(uiColor: .systemRed) , Color(uiColor: .systemRed)]
        }
        else if  isRightOptionTapped[index] {
            return [Color(uiColor: .systemBlue) , Color(uiColor: .systemBlue)]
        } else {
            return [Color(uiColor: .systemBlue) , Color(uiColor: .systemFill)]
        }
    }
    
    func leftOptionReset(_ index : Int) {
        isLeftOptionTapped[index] = false
        isRightOptionTapped[firstTappedIndex] = false
        firstTappedIndex = 10
        whichSideFirstTapped = ""
        bothSideTapped = false
    }
    
    func rightOptionReset(_ index : Int) {
        isRightOptionTapped[index] = false
        isLeftOptionTapped[firstTappedIndex] = false
        firstTappedIndex = 10
        whichSideFirstTapped = ""
        bothSideTapped = false
    }
}

#Preview {
    SameCardCollectingQuizView(progressValue: .constant(0))
        .environmentObject(EducationManager())
}
