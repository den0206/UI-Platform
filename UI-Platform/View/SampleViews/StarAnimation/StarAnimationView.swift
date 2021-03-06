//
//  StarAnimationView.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/12/09.
//

import SwiftUI

struct StarAnimationView: View {
    
    @State private var animationStart : Bool = false
    @State private var animationEnd : Bool = false
    
    private let startDuration = 11.0
    private let endDuration = 1.5
    
    let words : String = "It is a period of civil war. Rebel spaceships, striking from a hidden base, have won their first victory against the evil Galactic Empire. During the battle, Rebel spies managed to steal secret plans to the Empire’s ultimate weapon, the DEATH STAR, an armored space station with enough power to destroy an entire planet. Pursued by the Empire’s sinister agents, Princess Leia races home aboard her starship, custodian of the stolen plans that can save her people and restore freedom to the galaxy..."
    
    var body: some View {
        Text(words)
            .fontWeight(.bold)
            .font(.title)
            .foregroundColor(.yellow)
            .multilineTextAlignment(.center)
            .lineSpacing(10)
            .padding()
            .rotation3DEffect(Angle.degrees(animationEnd ? 0 : 60), axis: (x: 1, y: 0, z: 0))
            .shadow(color: Color.gray, radius: 2, x: 0, y: 15)
            .frame(width: 300, height: animationStart ? 750 : 0)
            .animation(Animation.linear(duration: animationEnd ? endDuration : startDuration))
            .onAppear {
                self.animationStart.toggle()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + startDuration) {
                    self.animationEnd.toggle()
                }
            }
    }
}

struct StarAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        StarAnimationView()
    }
}
