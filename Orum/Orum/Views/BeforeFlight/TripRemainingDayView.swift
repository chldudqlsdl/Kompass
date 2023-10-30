//
//  TripRemainingDayView.swift
//  Orum
//
//  Created by 차차 on 10/16/23.
//

import SwiftUI

struct TripRemainingDayView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    //    @AppStorage("dDay") var dDay: Date!
    @AppStorage("dDay") var dDay: Date = Date()
    
    var today = Date()
    var remainingDay: String {
        let day =  Calendar.current.compareDays(today, and: dDay)
        if day == 0 {
            return "D - Day !!!"
        }
        else {
            return "D - " + String(day)
        }
    }
    var body: some View {
        VStack {
            
            Image(systemName: "airplane.departure")
                .foregroundColor(.blue)
                .font(.system(size: 150))
                .padding(.top, 60)
                .padding(.bottom)
            
            Text(String(localized: "See you soon!"))
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 16)
            
            Text(String(localized: "We'll let you know when that day comes."))
                .font(.body)
            
            Spacer()
            
            Text("\(String(localized: "Until Departure Date")) \(dDay.formatted(date: .numeric, time: .omitted))")
                .foregroundColor(Color(red: 0.49, green: 0.49, blue: 0.49))
                .font(.footnote)
            
            VStack(spacing: 17) {
                Divider()
                
                Button(action: {
//                    withAnimation {
                            navigationManager.viewCycle = .third
//                    }
                }){
                    HStack {
                        Spacer()
                        
                        Text("\(remainingDay)") // TODO: 글씨 다크모드 지원
                            .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.26).opacity(0.3))
                        
                        
                        Spacer()
                    }
                    .padding(.vertical, 14)
                    .background(Color(red: 0.46, green: 0.46, blue: 0.5).opacity(0.12))
                    .cornerRadius(12)
                }
                .padding(.horizontal,15)
                .padding(.bottom, 24)
                .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 4)
                
            }
            .background(
                Rectangle()
                    .foregroundColor(.clear)
                    .background(Color(uiColor: .secondarySystemBackground)),alignment: .top
            )
        }
    }
}

#Preview {
    TripRemainingDayView()
        .environmentObject(NavigationManager())
}
