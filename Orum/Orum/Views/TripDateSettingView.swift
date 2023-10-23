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
                
                Text("안녕하세요 !")
                    .bold()
                    .font(.largeTitle)
                    .padding(.bottom, 50)
                
                Text("오름은 한국으로 향하는 비행기에서 한글을 읽는 방법을 학습하는 어플리케이션입니다. 최상의 경험을 제공하기 위해 오름은 사용자의 한국 여행 정보를 가져옵니다. ")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                
                Spacer()
                
                HStack {
                    Text("Enter your departure date")
                        .font(.footnote)
                        .bold()
                    
                    Spacer()
                }
                .padding(.horizontal, 15)
                
                
                Divider()
                
                DatePicker(
                    "Departure",
                    selection: $dDay,
                    displayedComponents: [.date]
                )
                .padding(.horizontal, 32)
                
                let remainingDay = Calendar.current.compareDays(today, and: dDay)

                VStack(spacing: 17) {
                    Divider()

                          if remainingDay != 0 {
                              NavigationLink(destination: TripRemainingDayView().navigationBarBackButtonHidden(true)) {
                                  Text("Next")
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
                                  Text("Next")
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
