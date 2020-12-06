//
//  IsometricView.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/12/06.
//

import SwiftUI


struct ExampleIsometricView : View  {
    
    var body: some View {
        
        IsometricView(active: true,extruded : true, depth : 20 ) {
            Rectangle().fill(LinearGradient(gradient: .init(colors: [Color.blue, Color.primary]), startPoint: .trailing, endPoint: .leading))
                .frame(width: 200, height: 200)
        }
        .shadow(color: Color.white, radius: 20, x: 0, y: 0)
        
        
    }
}

struct IsometricView<Content: View>: View {
    
    var active: Bool
    var content: Content
    var extruded: Bool
    var depth: CGFloat
    
    init(active: Bool, extruded: Bool, depth: CGFloat, @ViewBuilder content: ()-> Content) {
        self.active = active
        self.extruded = extruded
        self.depth = depth
        self.content = content()
    }
    
    @ViewBuilder var body: some View {
        if active {
            if extruded {
                content
                    .modifier(ExtrudeModifier(depth: depth, texture: content))
                    .modifier(IsometricViewModifier(active: active))
                    .animation(.easeInOut)
            } else {
                content
                    .modifier(IsometricViewModifier(active: active))
                    .animation(.easeInOut)
            }
        } else {
            content
                .animation(.easeInOut)
        }
        
    }
}

struct IsometricViewModifier : ViewModifier {
    
    var active : Bool = false
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: 45), anchor: .center)
            .scaleEffect(x: 1.0, y: 0.5, anchor: .center)
    }
}

struct ExtrudeModifier<Texture : View> : ViewModifier {
    
    
    var depth : CGFloat
    var texture : Texture
    
    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { geo in
                    texture
                        .brightness(-0.05)
                        .scaleEffect(x: 1, y: geo.size.height * geo.size.height, anchor: .bottom)
                        .frame(height: depth, alignment: .top)
                        .mask(Rectangle())
                        .rotation3DEffect(
                            Angle(degrees: 180),
                            axis: (x: 1.0, y: 0.0, z: 0.0),
                            anchor: .center,
                            anchorZ: 0.0,
                            perspective: 1.0
                        )
                        .projectionEffect(ProjectionTransform(CGAffineTransform(a: 1, b: 0, c: 1, d: 1, tx: 0, ty: 0)))
                        .offset(x: 0, y: geo.size.height)
                    
                }
                , alignment: .center)
            .overlay(
                GeometryReader { geo in
                    texture
                        .brightness(-0.1)
                        .scaleEffect(x: geo.size.width * geo.size.width, y: 1.0, anchor: .trailing)
                        .frame(width: depth, alignment: .leading)
                        .clipped()
                        .rotation3DEffect(
                            Angle(degrees: 180),
                            axis: (x: 0.0, y: 1.0, z: 0.0),
                            anchor: .leading,
                            anchorZ: 0.0,
                            perspective: 1.0
                        )
                        .projectionEffect(ProjectionTransform(CGAffineTransform(a: 1, b: 1, c: 0, d: 1, tx: 0, ty: 0)))
                        .offset(x: geo.size.width + depth, y: 0 + depth)
                }
                , alignment: .center)
    }
}
