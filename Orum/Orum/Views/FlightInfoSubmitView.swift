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
    @AppStorage("dep_time") var dep_time : String = ""
    @AppStorage("arr_time") var arr_time : String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Enter your flight code", text: $flightCode)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("fly") {
                    print(flightCode)
                    flightCodeAPIManager.performRequest(flightCode) { response in
                        if let response = response {
                            dep_city = response.dep_city
                            arr_city = response.arr_city
                            dep_time = response.dep_time
                            arr_time = response.arr_time
                            isFlightInfoEditViewActive = true
                            print(isFlightInfoEditViewActive)
                        } else {
                            alertShowing = true
                            print("alert")
                        }
                    }
                }
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                .background(Color.accentColor)
                .cornerRadius(8)
                .alert(isPresented: $alertShowing) {
                    Alert(title: Text("Alert"), message: Text("항공편 코드를 다시 한번 확인해주십시오"), dismissButton: .default(Text("닫기")))
                }
            }
            .padding()
            .navigationTitle("Check-in")
            .navigationDestination(isPresented: $isFlightInfoEditViewActive) {
                FlightInfoEditView()
            }
            
        }
        
    }
}

#Preview {
    FlightInfoSubmitView()
}
