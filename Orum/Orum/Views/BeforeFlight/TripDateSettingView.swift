//
//  TripDateSettingView.swift
//  Orum
//
//  Created by 차차 on 10/16/23.
//

import SwiftUI

struct TripDateSettingView: View {
    @State var today = Date()
    @State var isToday = false
    @State var isNotToday = false
    
    @AppStorage("dDay") var dDay: Date = Date()
    @EnvironmentObject var navigationManager: NavigationManager
    let dateFormatter = DateFormatter()
    
    var body: some View {
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
                
                Button(action: {
                    if remainingDay != 0 {
                        withAnimation {
                            navigationManager.viewCycle = .second
                        }
                    }
                    else {
                        withAnimation {
                            navigationManager.viewCycle = .third
                        }
                    }
                }) {
                    HStack {
                        Spacer()
                        
                        Text(String(localized: "Next"))
                            .foregroundColor(.white)
                        
                        Spacer()
                    }
                    .padding(.vertical, 14)
                    .background(Color.accentColor)
                    .cornerRadius(12)
                }
                .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 4)
                .padding(.bottom, 24)
                .padding(.horizontal, 15)
                
            }
            .background(
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 393, height: 129)
                    .background(Color(uiColor: .secondarySystemBackground)),alignment: .top
            )
        }
        .onAppear {
            dDay = Date()
        }
        .transition(.slide)
    }
}

#Preview {
    TripDateSettingView()
        .environmentObject(NavigationManager())
}
