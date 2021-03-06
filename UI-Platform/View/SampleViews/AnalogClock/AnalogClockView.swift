//
//  AnalogClockView.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/11/27.
//

import SwiftUI

struct AnalogClockView: View {
    
    @State private var isDark = true
    @State private var currentTime = Time(min: 0, sec: 0, hour: 0)
    @State private var receiver = Timer.publish(every: 1, on: .current, in: .default).autoconnect()
    
    var screenWidth = UIScreen.main.bounds.width
    
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Text("Analog Clock")
                    .font(.title)
                    .fontWeight(.heavy)
                
                Spacer(minLength: 0)
                
                Button(action: {isDark.toggle()}) {
                    Image(systemName: isDark ? "sun.min.fill" : "moon.fill")
                        .font(.system(size: 22))
                        .foregroundColor(isDark ? .black : .white)
                        .padding()
                        .background(Color.primary)
                        .clipShape(Circle())
                }
            }
            .padding()
            
            Spacer()
            
            ZStack {
                Circle()
                    .fill(Color.black.opacity(0.1))
                
                ForEach(0..<60, id : \.self) { i in
                    
                    Rectangle()
                        .fill(Color.primary)
                        .frame(width: 2, height: (i % 5) == 0 ? 15 : 5)
                        .offset(y: (screenWidth - 110) / 2)
                        .rotationEffect(.init(degrees: Double(i) * 6))
                    
                }
                
                /// sec
                
                Rectangle()
                    .fill(Color.primary)
                    .frame(width: 2, height: (screenWidth - 180) / 2)
                    .offset(y: -(screenWidth - 180) / 4)
                    .rotationEffect(.init(degrees: Double(currentTime.sec) * 6))
                
                /// min
                
                Rectangle()
                    .fill(Color.primary)
                    .frame(width: 4, height: (screenWidth - 200) / 2)
                    .offset(y: -(screenWidth - 200) / 4)
                    .rotationEffect(.init(degrees: Double(currentTime.min) * 6))
                
                /// hour
                
                Rectangle()
                    .fill(Color.primary)
                    .frame(width: 4.5, height: (screenWidth - 240) / 2)
                    .offset(y: -(screenWidth - 240) / 4)
                    .rotationEffect(.init(degrees: (Double(currentTime.hour) + (Double(currentTime.min) / 60)) * 30))
                
                Circle()
                    .fill(Color.primary)
                    .frame(width: 15, height: 15)
                
            }
            .frame(width: screenWidth - 80, height: screenWidth - 80)
            
          
            Text(getTime())
                .font(.system(size: 45))
                .fontWeight(.heavy)
                .padding(.top,10)
            
            Spacer()
            
            
        }
        .preferredColorScheme(isDark ? .dark : .light)
        .onAppear {
            let calender = Calendar.current
            
            let min = calender.component(.minute, from: Date())
            let sec = calender.component(.second, from: Date())
            let hour = calender.component(.hour, from: Date())
            
            withAnimation(Animation.linear(duration: 0.01)) {
                self.currentTime = Time(min: min, sec: sec, hour: hour)
            }
        }
        .onReceive(receiver) { (_) in
            let calender = Calendar.current
            
            let min = calender.component(.minute, from: Date())
            let sec = calender.component(.second, from: Date())
            let hour = calender.component(.hour, from: Date())
            
            withAnimation(Animation.linear(duration: 0.01)) {
                self.currentTime = Time(min: min, sec: sec, hour: hour)
            }
            
        }
    }
    
    
    func getTime() -> String {
        let format = DateFormatter()
        format.dateFormat = "hh:mm a"
        
        return format.string(from: Date())
    }
}


struct Time {
    var min : Int
    var sec : Int
    var hour : Int
}


struct AnalogClockView_Previews: PreviewProvider {
    static var previews: some View {
        AnalogClockView()
    }
}
