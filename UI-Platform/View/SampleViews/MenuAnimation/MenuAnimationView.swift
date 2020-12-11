//
//  MenuAnimationView.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/12/11.
//

import SwiftUI


struct MenuAnimationView : View {
    
    @State private var isAnimating : Bool = false
    @State private var selected = ""
    
    var body: some View {
        
        VStack {
            ZStack {
                
                ExpandingView(expand: $isAnimating, direction: .bottom, symbolName: "stop", action: {selected = "Stop"})
                ExpandingView(expand: $isAnimating, direction: .left, symbolName: "backward", action: {selected = "backward"})
                ExpandingView(expand: $isAnimating, direction: .top, symbolName: "play", action: {selected = "play"})
                ExpandingView(expand: $isAnimating, direction: .right, symbolName: "forward", action: {selected = "forward"})
                
                Image(systemName: "plus")
                    .font(.system(size: 40,weight : isAnimating ? .regular : .semibold, design : .rounded))
                    .foregroundColor(isAnimating ? .white : .black)
                    .rotationEffect(isAnimating ? .degrees(45) : .degrees(0))
                    .scaleEffect(isAnimating ? 3 : 1)
                    .opacity(isAnimating ? 0.5 : 1)
                    .animation(Animation.spring(response: 0.35 , dampingFraction: 0.85, blendDuration: 1))
                    .onTapGesture {
                        isAnimating.toggle()
                    }
            }.frame(height: 300)
            .padding()
            
            
            
            Text(selected)
                .foregroundColor(.white)
                .font(.title)
            
        }
        .preferredColorScheme(.dark)
        
    }
}

struct ExpandingView : View {
    
    @Binding var expand : Bool
    var direction : ExpandDirection
    var symbolName : String
    var action : ()->Void
    
    var body: some View {
        
        ZStack {
            ZStack {
                Image(systemName: symbolName)
                    .font(.system(size: 32,weight : .medium,design : .rounded))
                    .foregroundColor(Color.black)
                    .padding()
                    .opacity(expand ? 0.85 : 0)
                    .scaleEffect(expand ? 1 : 0)
                    .rotationEffect(expand ? .degrees(-43) : .degrees(0))
                
            }
            .frame(width: 82, height: 82)
            .background(Color.white)
            .cornerRadius(expand ? 41 : 8)
            .scaleEffect(expand ? 1 : 0.5)
            .offset(x: expand ? direction.offset.0 : 0, y:  expand ? direction.offset.1 : 0)
            .rotationEffect(expand ? .degrees(43) : .degrees(0))
            .animation(Animation.easeOut(duration: 0.25).delay(0.05))
        }
        .onTapGesture {
            self.expand.toggle()
            action()
        }
        .offset(x: direction.containerOffset.0, y: direction.containerOffset.1)
    }
}

enum ExpandDirection {
    case bottom
    case left
    case right
    case top
    
    var offset : (CGFloat,CGFloat) {
        switch  self {
        
        case .bottom:
            return (32,62)
        case .left:
            return (-62,32)
        case .right:
            return (-32,-62)
        case .top:
            return (62,-32)

        }
    }
    
    var containerOffset : (CGFloat, CGFloat) {
        switch  self {
        case .bottom:
            return (18,18)
        case .left:
            return (-18,18)
        case .right:
            return (-18,-18)
        case .top:
            return (18,-18)
            
        }
    }
}

struct MenuAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MenuAnimationView()
    }
}
