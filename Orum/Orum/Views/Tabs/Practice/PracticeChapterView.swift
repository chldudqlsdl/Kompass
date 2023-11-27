//
//  PracticeChapterView.swift
//  Orum
//
//  Created by Youngbin Choi on 11/16/23.
//

import SwiftUI



struct PracticeChapterView: View {
    
    var chapterIndex: Int {
        practiceManager.chapterIndex
    }
    var chapterName: String {
        Constants.Practice.chapter[chapterIndex]
    }
    
    @State var symbolEffectArray: [Bool] = [Bool](repeating: false, count: 20)
//    var symbolEffectArray: [Bool] {
//        if chapterName == "Food" {
//            return [Bool](repeating: false, count: 18)
//        }
//        else if chapterName == "Tourism" {
//            return [Bool](repeating: false, count: 20)
//
//        }
//        else {
//            return [Bool](repeating: false, count: 15)
//        }
//    }
    
    @EnvironmentObject var practiceManager : PracticeManager
    
    @State private var symbolEffectCounter: Bool = false
    @State private var selectedWord: PracticeWord? = nil
    @Namespace private var animation
    
    var body: some View {
        VStack(spacing: 0){
            Divider()
            ScrollView{
                VStack{
                    VStack(alignment: .leading){
                        HStack{
                            Image(systemName: "lightbulb.fill")
                                .font(.body)
                                .foregroundColor(.yellow)
                            Text("Tip")
                                .bold()
                                .font(.body)
                            Spacer()
                        }
                        .padding(EdgeInsets(top: 16, leading: 16, bottom: 5, trailing: 16))
                        Divider()
                            .padding(.leading, 16)
                        Text("Touch the pronounce button and get the description of the word.")
                            .padding(EdgeInsets(top: 5, leading: 16, bottom: 16, trailing: 16))
                            .foregroundColor(Color(uiColor: .secondaryLabel))
                    }
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color(uiColor: .quaternarySystemFill))
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .strokeBorder(Color(uiColor: .secondarySystemFill), lineWidth: 0.5, antialiased: true)
                    )
                    .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
                    
                    VStack(spacing: 8) {
//                        ForEach(practiceWords[chapterName]!) { practiceWord in
                        ForEach(Array(practiceWords[chapterName]!.enumerated()), id: \.element.id) { index, practiceWord in
                            VStack(alignment: .leading ,spacing: 0){
                                Button(action: {
                                    
                                    withAnimation {
                                        if selectedWord == practiceWord {
                                            selectedWord = nil
                                        }
                                        else {
                                            selectedWord = practiceWord
                                            SoundManager.instance.playSound(sound: practiceWord.name, completion: {} )
                                        }
                                        
                                        practiceManager.practicedWords.append(practiceWord.name)
                                       
                                    }
                                    symbolEffectArray[index].toggle()
                                }, label: {
                                    HStack(alignment: .center, spacing: 15) {
                                        if ( practiceWord != selectedWord ){
                                            
                                            if practiceManager.practicedWords.contains(practiceWord.name) {
                                                Image("\(Constants.Practice.image[practiceWord.name]!)")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .matchedGeometryEffect(id: practiceWord.image, in: animation)
                                                    .frame(width: 32, height: 32)
                                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                            } else {
                                                RoundedRectangle(cornerRadius: 8)
                                                    .strokeBorder(style: StrokeStyle(lineWidth: 3, dash: [5]))
                                                    .foregroundColor( practiceManager.practicedWords.contains(practiceWord.name) ? .clear : Color(uiColor: .secondarySystemFill))
                                                    .frame(width: 32, height: 32)
                                            }
                                            
                                            //                                            RoundedRectangle(cornerRadius: 8)
                                            //                                                .strokeBorder(style: StrokeStyle(lineWidth: 3, dash: [5]))
                                            //                                                .foregroundColor( practiceManager.practicedWords.contains(practiceWord.name) ? .clear : Color(uiColor: .secondarySystemFill))
                                            //                                                .frame(width: 32, height: 32)
                                            //                                                .overlay{
                                            //                                                    if practiceManager.practicedWords.contains(practiceWord.name) {
                                            //                                                        Image("\(Constants.Practice.image[practiceWord.name]!)")
                                            //                                                            .resizable()
                                            //                                                            .scaledToFit()
                                            //                                                            .matchedGeometryEffect(id: practiceWord.image, in: animation)
                                            //                                                    }
                                            //                                                }
                                        }
                                        
                                        
                                        VStack(spacing: 0) {
                                            HStack(alignment: .center) {
                                                Text("\(practiceWord.name)")
                                                    .bold()
                                                    .font(.title2)
                                                    .matchedGeometryEffect(id: practiceWord.id, in: animation)
                                                
                                                Spacer()
                                                
                                                Capsule()
                                                    .frame(width: 57, height: 34)
                                                    .foregroundStyle(Color(uiColor: .tertiarySystemFill))
                                                    .overlay {
                                                        HStack(spacing: 0){
                                                            Image(systemName: "chevron.up")
                                                                .font(.footnote)
                                                                .foregroundStyle(.blue)
                                                                .opacity(0.4)
                                                                .rotationEffect(.degrees(practiceWord == selectedWord ? 0 : 180))
                                                            if #available(iOS 17.0, *) {
                                                                Image(systemName: "speaker.wave.2.fill")
                                                                    .font(.body)
                                                                    .foregroundStyle(.blue)
                                                                    .symbolEffect(.bounce, value: symbolEffectArray[index])
                                                            }
                                                            else {
                                                                Image(systemName: "speaker.wave.2.fill")
                                                                    .font(.body)
                                                                    .foregroundStyle(.blue)
                                                            }
                                                        }
                                                        
                                                    }
                                                    .padding(.trailing, 15)
                                            }
                                            .padding(.top, 7)
                                            .padding(.bottom, 15)
                                            
                                        }
                                        
                                    }
                                    .contentShape(Rectangle())
                                })
                                .buttonStyle(.plain)
                                .transition(.opacity)
                                
                                if selectedWord == practiceWord {
                                    Text("\(practiceWord.explanation)")
                                        .foregroundStyle(Color(uiColor: .secondaryLabel))
                                        .transition(.opacity)
                                        .padding(.trailing)
                                    
                                }
                                
                                ZStack {
                                    
                                    if selectedWord == practiceWord {
                                        if chapterIndex == 2 {
                                            RoundedRectangle(cornerRadius: 8)
                                                .foregroundStyle(Color(uiColor: .systemBackground))
                                                .overlay {
                                                    Image("\(Constants.Practice.image[practiceWord.name]!)")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .matchedGeometryEffect(id: practiceWord.image, in: animation)
                                                }
                                                .frame(height: practiceWord == selectedWord ? 190 : 0)
                                                .padding(.vertical, selectedWord == practiceWord ? 16 : 0 )
                                        } else {
                                            Image("\(Constants.Practice.image[practiceWord.name]!)")
                                                .resizable()
                                                .aspectRatio(contentMode: chapterIndex == 2 ? .fit : .fill)
                                                .matchedGeometryEffect(id: practiceWord.image, in: animation)
                                                .frame(height: practiceWord == selectedWord ? 190 : 0)
                                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                                .padding(.vertical, selectedWord == practiceWord ? 16 : 0 )
                                        }
                                    }
                                    
                                }
                                .padding(.trailing)
                                
                                
                                Divider()
                            }
                        }
                        .padding(.leading)
                    }
                }
            }
            .navigationTitle(chapterName)
            .toolbarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    PracticeChapterView()
        .environmentObject(PracticeManager())
}
