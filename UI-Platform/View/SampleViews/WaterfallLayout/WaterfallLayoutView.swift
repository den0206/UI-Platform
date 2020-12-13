//
//  WaterfallLayoutView.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/12/12.
//

import SwiftUI

struct WaterFallModel :Hashable {
    
    let title : String
    let color : Color = Color.random
    
    /// also use background Image...
}


struct WaterfallLayoutView: View {
    
    let leftCards = [WaterFallModel(title: "L1"), WaterFallModel(title: "L2"), WaterFallModel(title: "L3"), WaterFallModel(title: "L4")]
    let rightCards = [WaterFallModel(title: "R1"), WaterFallModel(title: "R2"), WaterFallModel(title: "R3"),WaterFallModel(title: "R4")]
    
    var body: some View {
        
        ScrollView {
            HStack (spacing :16) {
                VStack {
                    ForEach(Array(leftCards.enumerated()),id : \.element) { offset, card in
                        WaterfallCell(model: card)
                            .frame(height: offset % 2 == 0 ? 320 : 200)
                    }
                }
                
                VStack {
                    ForEach(Array(rightCards.enumerated()),id : \.element) { offset, card in
                        WaterfallCell(model: card)
                            .frame(height: offset % 2 != 0 ? 320 : 200)
                    }
                }
            }
            .padding()
        }
    }
}

struct WaterfallCell : View {
    
    let model : WaterFallModel
    
    var body: some View {
     
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(model.color)
            .overlay(
                Text(model.title)
                    .foregroundColor(.white)
                    .font(.title3)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(8)
            )

        
        //MARK: - use image
        
//        GeometryReader { geo in
//            Image("")
//                .resizable()
//                .scaledToFill()
//                .frame(width: geo.size.width, height: geo.size.height)
//                .clipped()
//                .cornerRadius(10)
//                .overlay(
//                    ZStack {
//                        RoundedRectangle(cornerRadius: 10).fill(Color.gray).opacity(0.4)
//                        Text(model.title.uppercased())
//                            .foregroundColor(.white)
//                            .font(.title)
//                    }
//                )
//
//        }
    }
}



struct WaterfallLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        WaterfallLayoutView()
    }
}
