//
//  DepartRemainingTimeView.swift
//  Orum
//
//  Created by 차차 on 10/19/23.
//

import SwiftUI

struct DepartRemainingTimeView: View {
    @AppStorage("dep_time") var dep_time : Date = Date()
    @StateObject var educationManager = EducationManager()
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        
        return formatter
    }
    
    @State var remainingSeconds: Int = 3600
    @State var isCountdownOver: Bool = false
    
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            VStack {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.blue)
                    .font(.system(size: 150))
                    .padding(.top, 60)
                    .padding(.bottom, 30)
                
                Text("Let's see on plane!")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 20)
                
                Text("대충 기대된다는 텍스트")
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
            
            Text("Until Departure Time \(dateFormatter.string(from:dep_time))")
                .font(.footnote)
                .foregroundColor(Color(red: 0.49, green: 0.49, blue: 0.49))
            
            VStack(spacing: 17) {
                Divider()

                HStack {
                    NavigationLink(destination: HangulEducationMainView()
                        .navigationBarBackButtonHidden(true)
                        .environmentObject(educationManager)
                    ) {
                        Text(timeString(remainingSeconds))
                            .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.26).opacity(0.3))
                            .padding(.horizontal, 150)
                            .padding(.vertical, 14)
                            .background(Color(red: 0.46, green: 0.46, blue: 0.5).opacity(0.12))
                            .cornerRadius(12)
                            .onReceive(timer) { _ in
                                if remainingSeconds > 0 {
                                    remainingSeconds -= 1
                                }
                                else {
                                    isCountdownOver.toggle()
                                }
                            }
                    }
                    .padding(.bottom, 24)
                    .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 4)
                }
            }
            .background(
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 393, height: 129)
                    .background(Color(red: 0.96, green: 0.96, blue: 0.96)),alignment: .top
            )
        }
        .onAppear {          
            remainingSeconds = Int(dep_time.timeIntervalSince(Date()))
        }
        .onDisappear {
            timer.upstream.connect().cancel()
        }
    }
    
    func timeString(_ seconds: Int) -> String {
            var minutes = seconds / 60
            let hours = minutes / 60
            minutes = minutes % 60
            let seconds = seconds % 60
            return String(format: "%02d:%02d:%02d",hours, minutes, seconds)
        }
}

#Preview {
    DepartRemainingTimeView(educationManager: EducationManager())

}
