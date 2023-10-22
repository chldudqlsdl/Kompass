//
//  DepartRemainingTimeView.swift
//  Orum
//
//  Created by 차차 on 10/19/23.
//

import SwiftUI

struct DepartRemainingTimeView: View {
    @AppStorage("dep_time") var dep_time : String = ""

    var body: some View {
        VStack {
            Image(systemName: "airplane.departure")
                .foregroundColor(.blue)
                .font(.system(size: 150))
                .padding(.top, 200)
                .padding(.bottom, 30)
            
            Text("Let's see on plane!")
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 20)
            
            Text("대충 기대된다는 텍스트")
                .multilineTextAlignment(.center)
        }
        
        Spacer()
        
        Text("Until Departure Time \(dep_time)")
            .font(.footnote)
            .foregroundColor(Color(red: 0.49, green: 0.49, blue: 0.49))
        
        VStack(spacing: 17) {
                  Rectangle()
                      .foregroundColor(.clear)
                      .frame(height: 1)
                      .background(Color(red: 0.91, green: 0.91, blue: 0.91))

                      NavigationLink(destination: TripRemainingDayView().navigationBarBackButtonHidden(true)) {
                          Text("Next")
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
    DepartRemainingTimeView()
}
