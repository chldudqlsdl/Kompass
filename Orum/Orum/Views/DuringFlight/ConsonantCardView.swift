//
//  CosonantCardView.swift
//  Orum
//
//  Created by Youngbin Choi on 10/20/23.
//
//
//import SwiftUI
//
//struct ConsonantCardView: View {
//    @AppStorage("arr_time") var arr_time: Date = Date()
//    
//    @EnvironmentObject var educationManager: EducationManager
//
//    @State var hangulUnit : HangulUnit
//    @State var flipCheck : Bool = false
//    @State var example1Check : Bool = false
//    @State var example2Check : Bool = false
//    @State var checkCount : Int = 0
//    @State var nextWordActive: Bool = false
//    @State var flipped: Bool = false
//    @State var chapterViewActive: Bool = false
//    @State var remainingSeconds: Int = 3600
//    @State var isCountdownOver: Bool = false
//    
//    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//    
//    var body: some View {
//        
//        NavigationStack{
//            ZStack{
//                Color(uiColor: UIColor(hex: "F2F2F7")).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
//                VStack{
//                        ConsonantCardContentView(hangulUnit: $hangulUnit, flipCheck: $flipCheck, example1Check: $example1Check, example2Check: $example2Check, checkCount: $checkCount, flipped: $flipped)
//                    Spacer()
//                    Divider()
//                        .padding(.vertical, 10)
//                    HStack{
////                        ZStack{
////                            Image(systemName: "arrow.uturn.backward")
////                                .foregroundStyle(.blue)
////                                .font(.system(size: 32.0))
////                                .padding(10)
////                        }
////                        .background(Color.white)
////                        .clipShape(RoundedRectangle(cornerRadius: 20.0))
//////                        .shadow(radius: 3)
////                        .onTapGesture {
////                            previousWord()
////                        }
//                        Spacer()
//                        if checkCount < 3 {
//                            ZStack{
//                                HStack{
//                                    Text("\(checkCount)/3")
//                                        .font(.title2)
//                                        .fontWeight(.bold)
//                                        .foregroundStyle(Color(UIColor(hex: "D1D1D6")))
//                                    Image(systemName: "speaker.wave.2.circle.fill")
//                                        .font(.system(size: 32.0))
//                                        .foregroundStyle(example1Check ? .blue : Color(UIColor(hex: "D1D1D6")))
//                                    Image(systemName: "speaker.wave.2.circle.fill")
//                                        .font(.system(size: 32.0))
//                                        .foregroundStyle(example2Check ? .blue : Color(UIColor(hex: "D1D1D6")))
//                                    Image(systemName: "lightbulb.circle.fill")
//                                        .font(.system(size: 32.0))
//                                        .foregroundStyle(flipCheck ? .blue : Color(UIColor(hex: "D1D1D6")))
//                                    
//                                }
//                                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
//                            }
//                            .background(Color.white)
//                            .clipShape(RoundedRectangle(cornerRadius: 20.0))
////                            .shadow(radius: 3)
//                        } else {
//                            ZStack{
//                                HStack{
//                                    Image(systemName: "arrow.right.circle.fill")
//                                        .font(.system(size: 32.0))
//                                        .foregroundStyle(.white)
//                                    Text(String(localized: "Next"))
//                                        .fontWeight(.bold)
//                                        .font(.system(size: 17))
//                                        .foregroundStyle(.white)
//                                }
//                                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
//                            }
//                            .background(.blue)
//                            .clipShape(RoundedRectangle(cornerRadius: 20.0))
////                            .shadow(radius: 3)
//                            .onTapGesture {
////                                nextWordActive = true
//                                if hangulUnit.unitIndex + 1 == hangulUnit.hangulCards.count {
//                                    chapterViewActive = true
//                                } else {
//                                    nextWord()
//                                }
//                            }
//                        }
//                    }
//                    .padding(.bottom, 20)
//                }
//                .frame(width: UIScreen.main.bounds.size.width - 30)
//            }
//            .onAppear {
//                remainingSeconds = Int(arr_time.timeIntervalSince(Date()))
//            }
//            .onDisappear {
//                timer.upstream.connect().cancel()
//            }
//            .navigationTitle(hangulUnit.unitName.capitalized)
//            .navigationBarTitleDisplayMode(.large)
//            .navigationDestination(isPresented: $chapterViewActive, destination: {
//                ConsonantChapterView(hangulUnit:  HangulUnit(unitName: hangulUnit.unitName, unitIndex: hangulUnit.unitIndex + 1, hangulCards: hangulUnit.hangulCards)
//)
//                .environmentObject(educationManager)
//            })
//            .navigationBarBackButtonHidden()
////            .transition(.opacity)
//        }
//    }
//    func nextWord() {
//        withAnimation(.easeInOut(duration: 1)){
//            hangulUnit = HangulUnit(unitName: hangulUnit.unitName, unitIndex: hangulUnit.unitIndex + 1, hangulCards: hangulUnit.hangulCards)
//            flipCheck = false
//            example1Check = false
//            checkCount = 0
//            example2Check = false
//            flipped = false
//        }
//    }
//    
//    func previousWord() {
//        withAnimation(.easeInOut(duration: 1)){
//            hangulUnit = HangulUnit(unitName: hangulUnit.unitName, unitIndex: hangulUnit.unitIndex - 1, hangulCards: hangulUnit.hangulCards)
//            flipCheck = false
//            example1Check = false
//            checkCount = 0
//            example2Check = false
//            flipped = false
//        }
//    }
//    
//    func timeString(_ seconds: Int) -> String {
//        var minutes = seconds / 60
//        let hours = minutes / 60
//        minutes = minutes % 60
//        let seconds = seconds % 60
//        return String(format: "%02d:%02d:%02d",hours, minutes, seconds)
//    }
//}
//
//#Preview {
//    ConsonantCardView(hangulUnit: HangulUnit(unitName: "consonants1", unitIndex: 0, hangulCards: [
//        HangulCard(name: "ㄱ", sound: "g", example1: "가", example2: "구", soundExample1: "ga", soundExample2: "gu", quiz: "가든", lottieName: "gun"),
//        HangulCard(name: "ㄴ", sound: "n", example1: "나", example2: "누", soundExample1: "na", soundExample2: "nu", quiz: "나노", lottieName: "nose"),
//        HangulCard(name: "ㄷ", sound: "d", example1: "다", example2: "두", soundExample1: "da", soundExample2: "du", quiz: "다트", lottieName: "drink"),
//        HangulCard(name: "ㄹ", sound: "r", example1: "라", example2: "루", soundExample1: "ra", soundExample2: "ru", quiz: "라디오", lottieName: "road")
//    ])).environmentObject(EducationManager())
//}
