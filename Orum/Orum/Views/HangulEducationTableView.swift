//
//  HangulEducationTableView.swift
//  Orum
//
//  Created by 차차 on 10/23/23.
//

import SwiftUI

struct HangulEducationTableView: View {
    @EnvironmentObject var educationManager: EducationManager
    @State var isNextButtonPressed = false
    @State var isBackButtonPressed = false
    @State var remainingSeconds: Int = 3600
    @State var isCountdownOver: Bool = false
    
    @AppStorage("arr_time") var arr_time : Date = Date()
    @AppStorage("dep_time") var dep_time : Date?
    @AppStorage("duration") var duration: Int = 0
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        
        return formatter
    }
    
    var flightPercent: CGFloat {
        return CGFloat(100 - Int(Float(remainingSeconds) / Float(duration * 60)  * 100)) / 100
    }
    
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(uiColor: UIColor(hex: "F2F2F7")).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                VStack(spacing: 15) {
                    ZStack {
                        HStack {
                            Spacer()
                            
                            if remainingSeconds > 0 {
                                Text(timeString(remainingSeconds))
                                    .font(.caption2)
                                    .bold()
                                    .onReceive(timer) { _ in
                                        if remainingSeconds > 0 {
                                            remainingSeconds -= 1
                                        }
                                        else {
                                            isCountdownOver.toggle()
                                        }
                                    }
                            }
                            else {
                                Text("00:00:00")
                                    .font(.caption2)
                                    .bold()
                            }
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 7)
                        .background(RoundedRectangle(cornerRadius: 19)
                            .foregroundColor(.white)
                        )
                        
                        HStack {
                            HStack {
                                
                                if 100 - Int(Float(remainingSeconds) / Float(duration * 60)  * 100) <= 100 {
                                    Text("\(100 - Int(Float(remainingSeconds) / Float(duration * 60)  * 100))%")
                                        .font(.caption2)
                                        .bold()
                                        .padding(.trailing, 220 * CGFloat(flightPercent) )
                                }
                                else {
                                    Text("100%")
                                        .font(.caption2)
                                        .bold()
                                        .padding(.trailing, 220)
                                }
                                Image(systemName: "airplane")
                                    .font(.caption2)
                                    .bold()
                            }
                            .padding(.horizontal, 10)
                            .padding(.vertical, 7)
                            .background(.white)
                            .cornerRadius(29)
                            .overlay(
                                RoundedRectangle(cornerRadius: 29)
                                    .inset(by: 0.5)
                                    .stroke(.black, lineWidth: 1)
                            )
                            
                            Spacer()
                        }
                    }
                    .padding(.horizontal, 15)
                    
                    List {
                        Section(header: Text("\(educationManager.unit.rawValue)")
                            .font(.title)
                            .bold()
                            .foregroundColor(.primary)
                        ) {
                            VStack(alignment: .leading,spacing: 15) {
                                HStack {
                                    Image(systemName: "chevron.up")
                                        .bold()
                                    Text(String(localized: "Consonants"))
                                        .bold()
                                }
                                .padding(.top, 15)
                                .padding(.horizontal, 15)
                                
                                HStack {
                                    if educationManager.unit.rawValue == "Consonants 1" {
                                    ForEach (0 ..< 4) { _ in
                                            RoundedRectangle(cornerRadius: 4)
                                                .foregroundColor(.accentColor)
                                                .frame(width: 50 ,height: 70)
                                        }
                                    }
                                    else {
                                        RoundedRectangle(cornerRadius: 4)
                                            .stroke(.black, lineWidth: 1)
                                            .frame(width: 50, height: 70)
                                            .foregroundColor(Color.clear)
                                            .overlay(
                                                VStack{
                                                    Text("ㄱ")
                                                        .font(.largeTitle)
                                                        .bold()
                                                    
                                                    Text("[g]")
                                                    
                                                    Spacer()
                                                })
                                        
                                        RoundedRectangle(cornerRadius: 4)
                                            .stroke(.black, lineWidth: 1)
                                            .frame(width: 50, height: 70)
                                            .foregroundColor(Color.clear)
                                            .overlay(
                                                VStack{
                                                    Text("ㄴ")
                                                        .font(.largeTitle)
                                                        .bold()
                                                    
                                                    Text("[n]")
                                                    
                                                    Spacer()
                                                })
                                        
                                        RoundedRectangle(cornerRadius: 4)
                                            .stroke(.black, lineWidth: 1)
                                            .frame(width: 50, height: 70)
                                            .foregroundColor(Color.clear)
                                            .overlay(
                                                VStack{
                                                    Text("ㄷ")
                                                        .font(.largeTitle)
                                                        .bold()
                                                    
                                                    Text("[d]")
                                                    
                                                    Spacer()
                                                })
                                        
                                        RoundedRectangle(cornerRadius: 4)
                                            .stroke(.black, lineWidth: 1)
                                            .frame(width: 50, height: 70)
                                            .foregroundColor(Color.clear)
                                            .overlay(
                                                VStack{
                                                    Text("ㄹ")
                                                        .font(.largeTitle)
                                                        .bold()
                                                    
                                                    Text("[r]")
                                                    
                                                    Spacer()
                                                })
                            
                                    }
                                }
                                .padding(.horizontal, 20)
                                
                                HStack {
                                    ForEach (0 ..< 5) { _ in
                                        if educationManager.unit.rawValue == "Consonants 2" {
                                            RoundedRectangle(cornerRadius: 4)
                                                .foregroundColor(.accentColor)
                                                .frame(width: 50 ,height: 70)
                                        }
                                    }
                                }
                                .padding(.horizontal, 20)

                                
                                Divider()
                                
                                HStack {
                                    Image(systemName: "chevron.up")
                                        .bold()
                                    
                                    Text(String(localized: "Vowels"))
                                        .bold()
                                }
                                .padding(.horizontal, 15)
                                .padding(.bottom, 15)
                            }
                            
                        }
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    }
                    .padding(.top)
                    
                    Divider()
                    
                    HStack {
                        Button(action: {
                            isBackButtonPressed.toggle()
                        }) {
                            Image(systemName: "arrow.uturn.left")
                                .bold()
                                .padding(.all, 15)
                        }
                        .background(RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.white))
                        
                        Spacer()
                        
                        Button(action: {
                            isNextButtonPressed.toggle()
                        }) {
                            HStack {
                                Image(systemName: "arrow.right.circle.fill")
                                    .bold()
                                
                                Text(String(localized: "Next"))
                                    .bold()
                            }
                            .foregroundColor(.white)
                            .padding(.all, 15)
                        }
                        .cornerRadius(15)
                        .background(RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.accentColor))
                    }
                    .padding(.horizontal, 15)
                }
                .padding(.top, 15)
                .padding(.bottom, 40)
            }
            .navigationDestination(isPresented: $isNextButtonPressed, destination: {
                ConsonantCardView(hangulUnit: HangulUnit(unitName: "consonants1", unitIndex: 0, hangulCards: [
                    HangulCard(name: "ㄱ", sound: "g", example1: "가", example2: "구", soundExample1: "ga", soundExample2: "gu", quiz: "가든", lottieName: "gun"),
                    HangulCard(name: "ㄴ", sound: "n", example1: "나", example2: "누", soundExample1: "na", soundExample2: "nu", quiz: "나노", lottieName: "nose"),
                    HangulCard(name: "ㄷ", sound: "d", example1: "다", example2: "두", soundExample1: "da", soundExample2: "du", quiz: "다트", lottieName: "drink"),
                    HangulCard(name: "ㄹ", sound: "r", example1: "라", example2: "루", soundExample1: "ra", soundExample2: "ru", quiz: "라디오", lottieName: "road")
                ]))
                .environmentObject(educationManager)
                .navigationBarBackButtonHidden()
            })
            .navigationDestination(isPresented: $isBackButtonPressed, destination: {
                HangulEducationMainView()
                    .environmentObject(educationManager)
                    .navigationBarBackButtonHidden()
            })
            .onAppear {
                remainingSeconds = Int(arr_time.timeIntervalSince(Date()))
            }
            .onDisappear {
                timer.upstream.connect().cancel()
            }
        }
    }
    
    func timeString(_ seconds: Int) -> String {
        var minutes = seconds / 60
        let hours = minutes / 60
        minutes = minutes % 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d:%02d",hours, minutes, seconds)
    }
}

#Preview {
    HangulEducationTableView()
        .environmentObject(EducationManager())
}
