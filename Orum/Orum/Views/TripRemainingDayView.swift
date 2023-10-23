//
//  TripRemainingDayView.swift
//  Orum
//
//  Created by 차차 on 10/16/23.
//

import SwiftUI

struct TripRemainingDayView: View {
//    @AppStorage("dDay") var dDay: Date!
    @AppStorage("dDay") var dDay: Date = Date()

    var today = Date()
    
    var body: some View {
        let remainingDay = Calendar.current.compareDays(today, and: dDay)
        
        Image(systemName: "airplane.departure")
            .foregroundColor(.blue)
            .font(.system(size: 150))
            .padding(.top, 60)
            .padding(.bottom, 30)
        
        Text("See you soon !")
            .font(.largeTitle)
            .bold()
            .padding(.bottom, 30)
        
        Text("We'll let you know when that day comes")
            .font(.body)
        
        Spacer()
        
        Text("Until Departure Date \(dDay.formatted(date: .numeric, time: .omitted))")
            .foregroundColor(Color(red: 0.49, green: 0.49, blue: 0.49))
        
        VStack(spacing: 17) {
            Divider()
            
            NavigationLink(destination: FlightInfoSubmitView().navigationBarBackButtonHidden(true)) {
                Text("D - \(remainingDay)")
                    .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.26).opacity(0.3))
                    .padding(.horizontal, 161)
                    .padding(.vertical, 14)
                    .background(Color(red: 0.46, green: 0.46, blue: 0.5).opacity(0.12))
                    .cornerRadius(12)
            }
            .padding(.bottom, 24)
            .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 4)
        }
        .background(
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 393, height: 129)
                .background(Color(red: 0.96, green: 0.96, blue: 0.96)),alignment: .top
        )
        
    }
}

#Preview {
    TripRemainingDayView()
}
