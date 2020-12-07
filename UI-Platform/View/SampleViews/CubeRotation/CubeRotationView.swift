//
//  CubeRotationView.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/12/04.
//

import SwiftUI

struct CubeRotationView: View {
    
    @State private var index : Int = 0
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var colors : [Color] = [.red,.blue,.green,.orange,.purple]
    
    var body: some View {
        ZStack {
            ForEach(colors.indices) { i in
                if index == i {
                    colors[i].transition(.cubeRotation)
                }
                
            }
        }
        .frame(width: 200, height: 200, alignment: .center)
        .shadow(color: Color.white, radius: 10, x: 0, y: 0)
        .onReceive(timer) { (_) in
            withAnimation(Animation.easeOut(duration: 1)) {
                index = (index + 1) % colors.count
            }
        }
    }
}


//MARK: - modifier

struct CubeRotationModifier : AnimatableModifier {
    
    enum SlideDirection {
        case enter
        case exit
    }
    
    var pct : Double
    var direction : SlideDirection
    
    var animatableData: Double {
        get {pct}
        set {pct = newValue}
    }
    
    func body(content: Content) -> some View {
        
        GeometryReader { geo in
            content
                .rotation3DEffect(Angle(degrees: calcRotation()), axis: (x: 0.0, y: 1.0, z: 0.0),anchor: direction == .enter ? .leading : .trailing,anchorZ: 0,perspective: 0.1)
                .transformEffect(.init(translationX: calcTranslation(geo: geo), y: 0))
        }
        
    }
    
    private func calcRotation() -> Double {
        
        if direction == .enter {
            return 90 - (pct * 90)
        } else {
            return -1 * (pct * 90)
        }
    }
    
    private func calcTranslation(geo : GeometryProxy) -> CGFloat {
        
        if direction == .enter {
            return geo.size.width - (CGFloat(pct) * geo.size.width)
        } else {
            return -1 * (CGFloat(pct) * geo.size.width)
        }
    }
}

extension AnyTransition {
    
    static var cubeRotation : AnyTransition {
        get {
            AnyTransition.asymmetric(insertion: AnyTransition.modifier(active: CubeRotationModifier(pct: 0, direction: .enter), identity: CubeRotationModifier(pct: 1, direction: .enter)), removal: AnyTransition.modifier(active: CubeRotationModifier(pct: 1, direction: .exit), identity: CubeRotationModifier(pct: 0, direction: .exit)))
        }
    }
}

struct CubeRotationView_Previews: PreviewProvider {
    static var previews: some View {
        CubeRotationView()
    }
}
