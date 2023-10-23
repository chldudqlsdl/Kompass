//
//  HangulEducationMainView.swift
//  Orum
//
//  Created by 차차 on 10/22/23.
//

import SwiftUI

struct HangulEducationMainView: View {
    @EnvironmentObject var educationManager: EducationManager
    @State var isPresented = false
    @State var remainingSeconds: Int = 3600
    @State var isCountdownOver: Bool = false
    
    @AppStorage("arr_time") var arr_time : Date = Date()
    @AppStorage("dep_time") var dep_time : Date?
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        
        return formatter
    }
    
    var flightPercent: CGFloat {
        return CGFloat(100 - Int(Float(remainingSeconds) / Float(flightTime)  * 100)) / 100
    }
    
    var flightTime:Int {
        return Int(arr_time.timeIntervalSince(dep_time ?? Date()))
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
                        .padding(.horizontal, 10)
                        .padding(.vertical, 7)
                        .background(RoundedRectangle(cornerRadius: 19)
                            .foregroundColor(.white)
                        )
                        
                        HStack {
                            HStack {
                                Text("\(100 - Int(Float(remainingSeconds) / Float(flightTime)  * 100))%")
                                    .font(.caption2)
                                    .bold()
                                    .padding(.trailing, 230 * CGFloat( flightPercent) )
                                
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
                        Section(header: Text(String(localized: "Hangul"))
                            .font(.title)
                            .bold()
                            .foregroundColor(.primary)
                        ) {
                            VStack(alignment: .leading,spacing: 15) {
                                HStack {
                                    Image(systemName: "chevron.up")
                                        .bold()
                                    Text("Consononats")
                                        .bold()
                                }
                                .padding(.top, 15)
                                .padding(.horizontal, 15)
                                
                                Text(String(localized: "Collect Card!"))
                                    .font(.caption2)
                                    .foregroundColor(.gray)
                                    .padding(.horizontal, 15)
                                
                                
                                Divider()
                                
                                HStack {
                                    Image(systemName: "chevron.up")
                                        .bold()
                                    
                                    Text(String(localized: "Vowels"))
                                        .bold()
                                }
                                .padding(.horizontal, 15)
                                
                                
                                
                                Text(String(localized: "Collect Card!"))
                                    .font(.caption2)
                                    .foregroundColor(.gray)
                                    .padding(.horizontal, 15)
                                    .padding(.bottom, 15)
                            }
                            
                        }
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    }
                    .padding(.top)
                    
                    HStack {
                        Spacer()
                        
                        Text(String(localized: "Let's continue learning and gather some pronunciation!"))
                            .bold()
                            .font(.footnote)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                    }
                    
                    Divider()
                    
                    HStack {
                        Text(String(localized: "Current Progress"))
                            .bold()
                            .padding(.vertical, 15)
                            .padding(.leading, 15)
                        
                        Spacer()
                        
                        Text("\(educationManager.educationProgress)%")
                            .foregroundColor(.accentColor)
                            .bold()
                            .padding(.trailing, 15)
                        
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.white)
                    )
                    .padding(.horizontal, 15)
                    
                    Button(action: {
                        isPresented.toggle()
                    }){
                        HStack {
                            Spacer()
                            
                            Text("\(String(localized: "Next")) - \(educationManager.unit.rawValue)")
                                .bold()
                                .foregroundColor(.white)
                                .padding(.vertical, 14)
                            Spacer()
                        }
                        .background(RoundedRectangle(cornerRadius: 15))
                        .padding(.horizontal,15)
                    }
                }
                .padding(.top, 15)
                .padding(.bottom, 40)
            }
            .navigationDestination(isPresented: $isPresented, destination: {
                HangulEducationTableView()
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
    HangulEducationMainView()
        .environmentObject(EducationManager())
}
