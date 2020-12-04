//
//  WaveAnimationView.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/12/01.
//

import SwiftUI

struct WaveAnimationView: View {
    let screen = UIScreen.main.bounds
    var body: some View {
        
        ZStack {
            Color.black
                .ignoresSafeArea(.all)
            
            Text("Wave Animation")
                .font(.title)
                .foregroundColor(.primary)
            
            WaveView()
            
        }
        .preferredColorScheme(.dark)
    }
}

struct WaveView: View {
    
    let screen = UIScreen.main.bounds
    @State var isAnimated = false
    var body: some View {
        return ZStack {
            
            getWavePath(interval: screen.width, amplitude: 160, base:  100 + screen.height/2)
                .foregroundColor(Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)).opacity(0.3))
                .offset(x: isAnimated ? -1*screen.width : 0)
                .animation(
                    Animation.linear(duration: 4)
                        .repeatForever(autoreverses: false)
                )
            getWavePath(interval: screen.width*1.2, amplitude: 130, base: 120 + screen.height/2)
                .foregroundColor(Color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)).opacity(0.3))
                .offset(x: isAnimated ? -1*screen.width*1.2 : 0)
                .animation(
                    Animation.linear(duration: 5)
                        .repeatForever(autoreverses: false)
                )
            getWavePath(interval: screen.width*1.5, amplitude: 100, base: 140 + screen.height/2)
                .foregroundColor(Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)).opacity(0.3))
                .offset(x: isAnimated ? -1*screen.width*1.5 : 0)
                .animation(
                    Animation.linear(duration: 3)
                        .repeatForever(autoreverses: false)
                )
            VStack {
                Spacer()
                
            }
            
        }.onAppear() {
            self.isAnimated = true
        }
        
        
    }
    
    func getWavePath(interval: CGFloat, amplitude: CGFloat = 100, base: CGFloat = UIScreen.main.bounds.height/2) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 0, y: base))
            path.addCurve(
                to: CGPoint(x: 1*interval , y: base),
                control1: CGPoint(x: interval * (0.35), y: amplitude + base ),
                control2: CGPoint(x: interval * (0.65), y: -amplitude + base)
            )
            path.addCurve(
                to: CGPoint(x: 2*interval , y: base),
                control1: CGPoint(x: interval * (1.35), y: amplitude + base ),
                control2: CGPoint(x: interval * (1.65), y: -amplitude + base)
            )
            path.addLine(to: CGPoint(x: 2*interval, y: screen.height))
            path.addLine(to: CGPoint(x: 0, y: screen.height))
            
        }
    }
}
