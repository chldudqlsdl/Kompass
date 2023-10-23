//
//  FlightInfoEditView.swift
//  Orum
//
//  Created by Youngbin Choi on 10/19/23.
//

import SwiftUI

struct FlightInfoEditView: View {
    
    @AppStorage("dep_city") var dep_city : String = ""
    @AppStorage("arr_city") var arr_city : String = ""
    @AppStorage("dep_time") var dep_time : Date = Date()
    @AppStorage("arr_time") var arr_time : Date = Date()
    
    var body: some View {
        NavigationStack{
            VStack {
                
                Text(String(localized: "We've been waiting for you!"))
                    .padding(.top, 140)
                    .padding(.bottom, 10)
                    .multilineTextAlignment(.center)
                    .font(.largeTitle)
                    .bold()
                
                Text(String(localized: "For a better app experience, we will retrieve information such as the departure time and arrival time of the flight."))
                    .font(.body)
                    .multilineTextAlignment(.center)
                
                
                Spacer()
                
                HStack {
                    Text(String(localized: "Please make sure the information on your ticket is correct."))
                        .font(.footnote)
                        .bold()
                        .padding(.horizontal, 16)
                    
                    Spacer()
                }
                
                Divider()
                   
                    DatePicker(
                        String(localized: "Departure"),
                        selection: $dep_time,
                        displayedComponents: [.date,.hourAndMinute]
                    )
                .padding(.horizontal, 32)
                .padding(.vertical, 5)
                
                Divider()
    
                    DatePicker(
                        String(localized: "Arrival"),
                        selection: $arr_time,
                        displayedComponents: [.date, .hourAndMinute]
                    )
                    .padding(.horizontal, 32)
                    .padding(.vertical, 5)
                
                Divider()
                
                HStack {
                    Text(String(localized: "From"))
                    
                    TextField(String(localized: "City"), text: $dep_city)
                        .textFieldStyle(.plain)
                        .multilineTextAlignment(.trailing)
                }
                .padding(.horizontal, 32)
                .padding(.vertical, 11)
                
                Divider()
                
                HStack {
                    Text(String(localized: "To"))
                    
                    TextField(String(localized: "City"), text: $arr_city)
                        .textFieldStyle(.plain)
                        .multilineTextAlignment(.trailing)
                    
                }
                .padding(.horizontal, 32)
                .padding(.vertical, 11)
                
                VStack(spacing: 17) {
                    Divider()
                    
                    NavigationLink(destination: DepartRemainingTimeView().navigationBarBackButtonHidden(true)) {
                        Text(String(localized: "Next"))
                            .bold()
                            .foregroundColor(.white)
                            .padding(.horizontal, 161)
                            .padding(.vertical, 14)
                            .background(Color.accentColor)
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
            .onAppear {
                print("FlightInfoEditView dep_time OnAppear", dep_time)
            }
        }
    }
}

#Preview {
    FlightInfoEditView()
}
