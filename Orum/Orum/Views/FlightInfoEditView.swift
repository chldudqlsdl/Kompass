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
                
                Text("We've been waiting for you!")
                    .padding(.top, 140)
                    .padding(.bottom, 10)
                    .multilineTextAlignment(.center)
                    .font(.largeTitle)
                    .bold()
                
                Text("더 나은 앱의 경험을 위해 비행기의 출발 시간,\n 도착 시간 등의 정보를 가져올께요.")
                    .font(.body)
                    .multilineTextAlignment(.center)

                
                Spacer()
                
                HStack {
                    Text("입력한 티켓의 정보가 정확한지 확인해주세요.")
                        .font(.footnote)
                        .bold()
                        .padding(.horizontal, 16)

                    Spacer()
                }
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(height: 1)
                    .background(Color(red: 0.91, green: 0.91, blue: 0.91))
                
                HStack {
                    Text("Departure")
                    
                    TextField("Departure Time", text: $dep_time)
                        .textFieldStyle(.plain)
                        .multilineTextAlignment(.trailing)
                }
                .padding(.horizontal, 32)
                .padding(.vertical, 11)

                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(height: 1)
                    .background(Color(red: 0.91, green: 0.91, blue: 0.91))
                
                HStack {
                    Text("Arrival")
                    
                    TextField("Arrival Time", text: $arr_time)
                        .textFieldStyle(.plain)
                        .multilineTextAlignment(.trailing)
                }
                .padding(.horizontal, 32)
                .padding(.vertical, 11)
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(height: 1)
                    .background(Color(red: 0.91, green: 0.91, blue: 0.91))
                
                HStack {
                    Text("From")
                    
                    TextField("Departure City", text: $dep_city)
                        .textFieldStyle(.plain)
                        .multilineTextAlignment(.trailing)
                }
                .padding(.horizontal, 32)
                .padding(.vertical, 11)
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(height: 1)
                    .background(Color(red: 0.91, green: 0.91, blue: 0.91))
                
                HStack {
                    Text("to")
                    
                    TextField("Arrival City", text: $arr_city)
                        .textFieldStyle(.plain)
                        .multilineTextAlignment(.trailing)

                }
                .padding(.horizontal, 32)
                .padding(.vertical, 11)

                VStack(spacing: 17) {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(height: 1)
                        .background(Color(red: 0.91, green: 0.91, blue: 0.91))
                    
                    NavigationLink(destination: DepartRemainingTimeView().navigationBarBackButtonHidden(true)) {
                        Text("Next")
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
        }
    }
}

#Preview {
    FlightInfoEditView()
}
