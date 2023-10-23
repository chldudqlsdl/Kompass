//
//  TripRemainingDayView.swift
//  Orum
//
//  Created by 차차 on 10/16/23.
//

import SwiftUI

struct TripRemainingDayView: View {
//    @AppStorage("dDay") var dDay: Date!
    @AppStorage("dDay") var dDay = Date()
    var today = Date()
    
    var body: some View {
        let remainingDay = Calendar.current.compareDays(today, and: dDay)
        
        Text("D - \(remainingDay) until Trip")
    }
}

#Preview {
    TripRemainingDayView()
}
