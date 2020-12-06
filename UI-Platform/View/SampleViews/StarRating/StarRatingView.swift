//
//  StarRatingView.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/12/05.
//

import SwiftUI

struct StarRatingView: View {
    
    @State  var stars : Int = 0
    @State private var popup : Bool = false
    
    var body: some View {
        
        
        Button(action: {
            withAnimation {
                popup.toggle()
            }
        }) {
            VStack(alignment: .center, spacing: 8) {
                StarIcon(filled: stars > 0,iconSize: 36)
                
                Text("Rate here!")
                    .foregroundColor(.primary)
                    .font(.system(size: 24, weight : .semibold, design : .rounded))
                
                
                Text("\(stars) / 5")
                    .foregroundColor(.primary)
                    .font(.system(size: 14, weight : .semibold, design : .rounded))
                    .opacity(stars > 0 ? 1 : 0)
                
            }
        }
        .overlay(
            HStack(alignment: .center, spacing: 4, content: {
                
                ForEach(0 ..< 5) { i in
                    StarIcon(filled: stars > i)
                }
            })
            .padding(12)
            .background(Color.secondary.colorInvert())
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.1),radius: 20,x: 0,y: 0)
            .offset(x: 0, y: -70)
            .opacity(popup ? 1 : 0)
            .gesture(rateGesture)
        )
   
    }
    
    var rateGesture : some Gesture {
        return DragGesture(minimumDistance: 0, coordinateSpace: .local)
            .onChanged { (value) in
                let x = value.location.x
                let percent = max((x / 110.0), 0.0)
                stars = min(Int(percent * 5.0) ,5)
                
            }.onEnded { (value) in
                let x = value.location.x
                let percent = max((x / 110.0), 0.0)
                stars = min(Int(percent * 5.0) ,5)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    withAnimation {
                        popup = false

                    }
                }
            }
     
    }

  
}

struct StarIcon : View {
    
    var filled :Bool = true
    var iconSize : CGFloat = 14
    
    var body: some View {
        Image(systemName: filled ? "star.fill" : "star")
            .font(.system(size: iconSize))
            .foregroundColor(filled ? .yellow : Color.primary)
    }
}

struct StarRatingView_Previews: PreviewProvider {
    static var previews: some View {
        StarRatingView()
    }
}
