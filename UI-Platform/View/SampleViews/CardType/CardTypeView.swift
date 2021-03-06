//
//  CardTypeView.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/12/03.
//

import SwiftUI

struct CardTypeView: View {
    @State private var flipped: Bool = false
    @State private var flip : Bool = false
    
    var body: some View {
        
        ZStack {
            Card(title: "Front View",description: "0000-00000-0000")
                .opacity(flipped ? 0 : 1)
            Card(title: "Rare View",description: "1111-11111-1111")
                .opacity(flipped ? 1 : 0)
        }
        .modifier(FlipEffect(flipped: $flipped,angle: flip ? 0 : 180))
        .onTapGesture {
            withAnimation {
                flip.toggle()
            }
        }
    }
}

struct Card : View {
    
    var title : String
    var description : String = ""
    var icon : String = ""
        
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(LinearGradient(gradient: .init(colors: [Color.green,Color.black]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .frame(width: 350, height: 250)
            .shadow(color: .white, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 5, y: 5)
            .overlay(
                VStack(spacing : 10) {
                    Text(title)
                        .font(.title2)
                        .foregroundColor(.white)
                    
                    if description != ""{
                        Text(description)
                            .font(.body)
                            .foregroundColor(.white)
                    }
                }
             
            )
            
        
    }
}

struct FlipEffect : GeometryEffect {
    
    var animatableData: Double {
        get { angle }
        set { angle = newValue }
    }
    
    @Binding var flipped : Bool
    var angle : Double

    func effectValue(size: CGSize) -> ProjectionTransform {
        
        DispatchQueue.main.async {
            flipped = angle >= 90 && angle < 270

        }
    
        let newAngle = flipped ? -180 + angle : angle
        let angleRadius = CGFloat(Angle(degrees: newAngle).radians)

        var transform3d = CATransform3DIdentity
        transform3d.m34 = -1/max(size.width, size.height)
        
        transform3d = CATransform3DRotate(transform3d, angleRadius, 0, 1, 0)
        transform3d = CATransform3DTranslate(transform3d, -size.width / 2, -size.height / 2, 0)
        
        let affineTransform = ProjectionTransform(CGAffineTransform(translationX: size.width / 2, y: size.height / 2))
        
        return ProjectionTransform(transform3d).concatenating(affineTransform)
        
    }
}

struct CardTypeView_Previews: PreviewProvider {
    static var previews: some View {
        CardTypeView()
    }
}
