//
//  RippleAnimationView.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/12/02.
//

import SwiftUI

struct RippleAnimationView: View {
    
    @State private var ripple = Ripple(diameter: 10, isFadding: false)
    var body: some View {
        
        ZStack {
            
            RippleView(ripple: $ripple).opacity(ripple.isFadding ? 0.1 : 1.0)
            Rectangle().fill(Color.clear)
        }
        .onAppear{
            
            withAnimation(Animation.linear(duration: 3.0).repeatForever(autoreverses: false)) {
                ripple.isFadding = true
                ripple.diameter = 300
            }
           
        }
        .background(Color.init(red: 229/255, green: 229/255, blue: 239/255))
        .edgesIgnoringSafeArea(.all)
    }
}

struct Ripple {
    
    var diameter : CGFloat
    var isFadding : Bool
}
struct RippleView : View {
    
    @Binding var ripple : Ripple
    
    var body: some View {
        
        Circle()
            .fill(Color(red: 225/255, green: 225/255, blue: 235/255))
            .frame(width: ripple.diameter, height: ripple.diameter)
            .overlay(
                Circle().stroke(Color.gray, lineWidth: 10)
                    .blur(radius: 4.0)
                    .offset(x: 2, y: 2)
            )
            .overlay(
                Circle().stroke(Color.white, lineWidth: 10)
                    .blur(radius: 4.0)
                    .offset(x: -2, y: -2)
            )
        
    }
}

struct RippleAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        RippleAnimationView()
    }
}
