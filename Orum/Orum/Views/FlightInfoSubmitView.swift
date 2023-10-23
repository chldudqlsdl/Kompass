//
//  FlightInfoSubmitView.swift
//  Orum
//
//  Created by 차차 on 10/16/23.
//

import SwiftUI

struct FlightInfoSubmitView: View {
    
    let flightCodeAPIManager = FlightCodeAPIManager()
    @State var flightCode = ""
    @State var isFlightInfoEditViewActive = false
    @State var alertShowing = false
    @AppStorage("dep_city") var dep_city : String = ""
    @AppStorage("arr_city") var arr_city : String = ""
    @AppStorage("dep_time") var dep_time : Date = Date()
    @AppStorage("arr_time") var arr_time : Date = Date()
    @AppStorage("duration") var duration : Int = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "wallet.pass")
                    .foregroundColor(.blue)
                    .font(.system(size: 150))
                    .padding(.top, 60)
                
                Text(String(localized: "We've been waiting for you!"))
                    .multilineTextAlignment(.center)
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 10)

                
                Text(String(localized: "For a better app experience, we will retrieve information such as the departure time and arrival time of the flight."))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 60)
                
                Spacer()
                
                HStack {
                    Text(String(localized: "Please enter the flight code to continue."))
                        .font(.footnote)
                        .bold()
                        .padding(.horizontal, 16)
                    
                    Spacer()
                }
                
                Divider()
                
                HStack {
                Text(String(localized: "Flight Code"))
                    
                    TextField(String(localized: "Enter your flight code"), text: $flightCode)
                        .textFieldStyle(.plain)
                        .multilineTextAlignment(.trailing)
                    
                }
                .padding(.vertical, 15)
                .padding(.horizontal, 32)
                
                VStack(spacing: 17) {
                    Divider()
                        
                    
                    HStack(spacing: 15) {
                        Button(action: {}) {
                            HStack {
                                Image(systemName: "wallet.pass.fill")
                                    .foregroundColor(.black)
                                Text("Wallet")
                            }
                        }
                        .foregroundColor(.black)
                        .padding(.horizontal, 45)
                        .padding(.vertical, 14)
                        .background(.white)
                        .cornerRadius(12)
                        .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 4)
                        
                        Button(String(localized: "Next")) {
                            print(flightCode)
                            flightCodeAPIManager.performRequest(flightCode) { response in
                                if let response = response {
                                    dep_city = response.dep_city
                                    arr_city = response.arr_city
                                    dep_time = response.dep_time.toDate() ?? Date()
                                    arr_time = response.arr_time.toDate() ?? Date()
                                    duration = response.duration
                                    isFlightInfoEditViewActive = true
                                    print(isFlightInfoEditViewActive)
                                } else {
                                    alertShowing = true
                                    print("alert")
                                }
                            }
                        }
                        .foregroundColor(.white)
                        .padding(.horizontal, 59)
                        .padding(.vertical, 14)
                        .background(Color.accentColor)
                        .cornerRadius(12)
                        .alert(isPresented: $alertShowing) {
                            Alert(title: Text(String(localized: "Alert")), message: Text(String(localized: "Please check the flight code again.")), dismissButton: .default(Text(String(localized: "Close"))))
                        }
                        .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 4)
                    }
                    .padding(.bottom, 24)
                }
                .background(
                  Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 393, height: 129)
                    .background(Color(red: 0.96, green: 0.96, blue: 0.96)),alignment: .top
                )
            }
            .navigationDestination(isPresented: $isFlightInfoEditViewActive) {
                FlightInfoEditView().navigationBarBackButtonHidden(true)
            }
        }
        
    }
}

extension String {
    func toDate() -> Date? { //"yyyy-MM-dd HH:mm"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        dateFormatter.timeZone = TimeZone(identifier: "KST")
        if let date = dateFormatter.date(from: self) {
            return date
        } else {
            return nil
        }
    }
}

#Preview {
    FlightInfoSubmitView()
}
