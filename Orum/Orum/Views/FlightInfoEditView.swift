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
    @AppStorage("dep_time") var dep_time : String = ""
    @AppStorage("arr_time") var arr_time : String = ""
    
    var body: some View {
        NavigationStack{
            VStack {
                HStack {
                    Text("Departure City")
                        .font(.callout)
                        .bold()
                    TextField("Departure City", text: $dep_city)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                HStack {
                    Text("Arrival City")
                        .font(.callout)
                        .bold()
                    TextField("Arrival City", text: $arr_city)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                HStack {
                    Text("Departure Time")
                        .font(.callout)
                        .bold()
                    TextField("Departure Time", text: $dep_time)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                HStack {
                    Text("Arrival Time")
                        .font(.callout)
                        .bold()
                    TextField("Arrival Time", text: $arr_time)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }
            .navigationTitle("Check your flight info")
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    FlightInfoEditView()
}
