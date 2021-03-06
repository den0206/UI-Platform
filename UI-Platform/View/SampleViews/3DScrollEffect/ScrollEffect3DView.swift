//
//  ScrollEffect3DView.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/12/04.
//

import SwiftUI

struct ScrollEffect3DView: View {
    
    /// set [Image] for example....
    @State private var color : Color = .blue
    var colors : [Color] = [.blue, .green, .orange, .red, .gray, .pink, .yellow]
    
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Text("\(color.description)")
                .foregroundColor(color)
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 10)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 230) {
                    ForEach(colors, id: \.self) { color in
                        GeometryReader { geometry in
                            Rectangle()
                                .foregroundColor(color)
                                .frame(width: 200, height: 300, alignment: .center)
                                .cornerRadius(16)
                                .shadow(color: Color.white.opacity(0.8), radius: 20, x: -10, y: 10)
                                .rotation3DEffect(Angle(degrees: (Double(geometry.frame(in: .global).minX) - 210) / -20), axis: (x: 0, y: 1.0, z: 0))
                                .onTapGesture {
                                    self.color = color
                                }
                        }
                    }
                }
                .padding(.vertical, 30)
                .padding(.horizontal, 210)
                
                
            }
            .padding(.vertical, 60)
        }
     
        
        
    }
}

struct ScrollEffect3DView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollEffect3DView()
            .preferredColorScheme(.dark)
    }
}
