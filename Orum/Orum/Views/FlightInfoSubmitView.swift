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
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "wallet.pass")
                    .foregroundColor(.blue)
                    .font(.system(size: 150))
                    .padding(.top, 60)
                
                Text("We've been waiting\n for you!")
                    .multilineTextAlignment(.center)
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 10)

                
                Text("더 나은 앱의 경험을 위해 비행기의 출발 시간, 도착 시간 등의 정보를 가져올게요.")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 60)
                
                Spacer()
                
                HStack {
                    Text("계속하려면 항공편 코드를 입력하십시오.")
                        .font(.footnote)
                        .bold()
                        .padding(.horizontal, 16)
                    
                    Spacer()
                }
                
                Divider()
                
                HStack {
                Text("Flight Code")
                    
                    TextField("Enter your flight code", text: $flightCode)
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
                        
                        Button("Next") {
                            print(flightCode)
                            flightCodeAPIManager.performRequest(flightCode) { response in
                                if let response = response {
                                    dep_city = response.dep_city
                                    arr_city = response.arr_city
                                    dep_time = response.dep_time.toDate() ?? Date()
                                    arr_time = response.arr_time.toDate() ?? Date()
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
                            Alert(title: Text("Alert"), message: Text("항공편 코드를 다시 한번 확인해주십시오"), dismissButton: .default(Text("닫기")))
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
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
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
