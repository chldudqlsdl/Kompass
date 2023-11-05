//
//  LearnView.swift
//  Orum
//
//  Created by 차차 on 10/31/23.
//

import SwiftUI

let chapterContent = [
    "ㄱㄴㄷㄹ",
    "ㅁㅂㅅㅇㅈ",
    "ㅊㅋㅌㅍㅎ",
    "ㅡㅗㅜㅛㅠ",
    "ㅣㅏㅑㅓㅕ",
    "ㅐㅔㅒㅖ",
    "ㄲㄸㅃㅆㅉ",
    "ㅢㅚㅟㅘㅝㅙㅞ"
]

let chapterName = [
    "Consonant1",
    "Consonant2",
    "Consonant3",
    "Vowel1",
    "Vowel2",
    "Vowel3",
    "Consonant1",
    "Vowel1",
]

let buttonDisabilityArr = [
    false,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
]

let progress: [Double] = [
    0.01,
    0.01,
    0.01,
    0.01,
    0.01,
    0.01,
    0.01,
    0.01,
]

struct LearnView: View {
    @State private var isPresented = false
    @State private var remainingTime: Int = 0
    @EnvironmentObject var educationManager: EducationManager
    
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text("Basic")
                            .bold()
                            .font(.title2)
                        
                        Text("Just few steps for read all of Hangul")
                            .foregroundColor(.secondary)
                    }
                    .padding(.horizontal, 15)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            Spacer()
                            
                            Spacer()
                            
                            ForEach(0 ..< 6) { index in
                                Button(action: {
                                    isPresented.toggle()
                                    educationManager.createContent()
                                }){
                                    VStack(alignment: .leading) {
                                        Text("\(chapterContent[index])")
                                            .bold()
                                            .foregroundColor(.white)
                                            .font(.title2)
                                            .padding(.leading, 16)
                                            .padding(.top, 16)
                                        
                                        Spacer()
                                        
                                        HStack {
                                            if (buttonDisabilityArr[index]) {
                                                Spacer()
                                                
                                                Image(systemName: "lock.fill")
                                                    .foregroundColor(.white)
                                                    .font(.largeTitle)
                                                    .padding(.bottom, 16)
                                                    .padding(.trailing, 16)
                                            }
                                            else {
                                                VStack {
                                                    ProgressView(value: progress[index])
                                                        .progressViewStyle(.linear)
                                                        .padding(.all, 15)
                                                        .background(RoundedRectangle(cornerRadius: 8)
                                                            .foregroundColor(.white)
                                                        )
                                                }
                                                .padding(.horizontal, 15)
                                                .padding(.bottom, 15)
                                            }
                                        }
                                    }
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(width: 157, height: 157)
                                    )
                                    
                                    Text("")
                                }
                                .frame(width: 157, height: 157)
                                .disabled(buttonDisabilityArr[index])
                            }
                            
                            Spacer()
                            
                            Spacer()
                        }
                    }
                    .scrollIndicators(.hidden)
                    
                }
                
                VStack(alignment: .leading) {
                    Text("Advance")
                        .bold()
                        .font(.title2)
                    
                    Text("Hangul master course")
                        .foregroundColor(.secondary)
                    
                    
                    HStack {
                        ForEach(0 ..< 2) { index in
                            Button(action: {
                                isPresented.toggle()
                                educationManager.createContent()
                            }){
                                VStack(alignment: .leading) {
                                    Text("\(chapterContent[index + 6])")
                                        .bold()
                                        .foregroundColor(.white)
                                        .font(.title2)
                                        .padding(.leading, 16)
                                        .padding(.top, 16)
                                    
                                    Spacer()
                                    
                                    HStack {
                                        Spacer()
                                        
                                        if (buttonDisabilityArr[index + 6]) {
                                            Image(systemName: "lock.fill")
                                                .foregroundColor(.white)
                                                .font(.largeTitle)
                                                .padding(.bottom, 16)
                                                .padding(.trailing, 16)
                                        }
                                        else {
                                            ProgressView()
                                                .progressViewStyle(.linear)
                                        }
                                    }
                                }
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 157, height: 157)
                                )
                            }
                            .frame(width: 157, height: 157)
                            .disabled(buttonDisabilityArr[index + 6])
                        }
                        
                        Spacer()
                    }
                    
                }
                .padding(.horizontal, 15)
                
                Spacer()
                
                Divider()
            }
            .fullScreenCover(isPresented: $isPresented, content: {
                HangulEducationView(isPresented: $isPresented, content: $educationManager.content)
            })
            .navigationTitle("Learn")
        }
    }
}

#Preview {
    LearnView()
        .environmentObject(EducationManager())
}
