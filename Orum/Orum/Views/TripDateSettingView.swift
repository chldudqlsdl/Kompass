//
//  TripDateSettingView.swift
//  Orum
//
//  Created by 차차 on 10/16/23.
//

import SwiftUI

struct TripDateSettingView: View {
    @State var today = Date()
    @AppStorage("dDay") var dDay: Date = Date()
    @EnvironmentObject var navigationManager: NavigationManager
    let dateFormatter = DateFormatter()
    
    var body: some View {
        NavigationView {
            VStack {
                
                Image(systemName: "info.bubble")
                    .foregroundColor(.blue)
                    .font(.system(size: 150))
                    .padding(.top, 60)
                    .padding(.bottom)
                
                Text(String(localized: "Hello!"))
                    .bold()
                    .font(.largeTitle)
                    .padding(.bottom, 16)
                
                Text(String(localized: "Orum is an application that teaches how to read Korean while on a flight to Korea. To provide the best experience, Orum retrieves user's travel information to tailor the experience."))
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                
                Spacer()
                
                HStack {
                    Text(String(localized: "Enter your departure date"))
                        .font(.footnote)
                        .bold()
                    
                    Spacer()
                }
                .padding(.horizontal, 8)
                
                
                Divider()
                
                DatePicker(
                    String(localized: "Departure"),
                    selection: $dDay,
                    displayedComponents: [.date]
                )
                .padding(.horizontal, 32)
                
                let remainingDay = Calendar.current.compareDays(today, and: dDay)

                VStack(spacing: 17) {
                    Divider()

                          if remainingDay != 0 {
                              NavigationLink(destination: TripRemainingDayView().navigationBarBackButtonHidden(true)) {
                                  Text(String(localized: "Next"))
                                      .foregroundColor(.white)
                                      .padding(.horizontal, 161)
                                      .padding(.vertical, 14)
                                      .background(Color.accentColor)
                                      .cornerRadius(12)
                              }
                              .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 4)
                              .padding(.bottom, 24)
                          }
                          else {
                              NavigationLink(destination: FlightInfoSubmitView().navigationBarBackButtonHidden(true)) {
                                  Text(String(localized: "Next"))
                                      .bold()
                                      .foregroundColor(.white)
                                      .padding(.horizontal, 161)
                                      .padding(.vertical, 14)
                                      .background(Color.accentColor)
                                      .cornerRadius(12)
                              }
                              .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 4)
                              .padding(.bottom, 24)
                          }
                      }
                      .background(
                        Rectangle()
                          .foregroundColor(.clear)
                          .frame(width: 393, height: 129)
                          .background(Color(red: 0.96, green: 0.96, blue: 0.96)),alignment: .top
                      )
            }
        }
        
    }
}

#Preview {
    TripDateSettingView()
}
