//
//  PieChartView.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/11/28.
//

import SwiftUI

// model

enum Asset {
    case equality, cash, bond,real
}

struct AssetAllLocastion {
    let asset : Asset
    let percentage : Double
    let description : String
    let color : Color
}

final class PieChartViewModel : ObservableObject {
    
    @Published var data : [AssetAllLocastion] = [
        AssetAllLocastion(asset: .equality, percentage: 0.1, description: "equality", color: .gray),
        AssetAllLocastion(asset: .cash, percentage: 0.4, description: "Cash", color: .green),
        AssetAllLocastion(asset: .bond, percentage: 0.3, description: "Bond", color: .orange),
        AssetAllLocastion(asset: .real, percentage: 0.2, description: "Real", color: .red)
        
    ]
}

struct PieceofPie : Shape {
    let startDegree :Double
    let endDegree : Double
    
    func path(in rect: CGRect) -> Path {
        
        Path { p in
            
            let center = CGPoint(x: rect.midX, y: rect.midY)
            p.move(to: center)
            p.addArc(center: center, radius: rect.width / 2, startAngle: Angle(degrees: startDegree), endAngle: Angle(degrees: endDegree), clockwise: false)
            
            p.closeSubpath()
            
        }
    }
}

struct PieChartView: View {
    
    @State private var angle = 0.0
    var body: some View {
        
        VStack {
            
            Spacer()
            
            ZStack {
                pieChart()
                    .rotationEffect(.degrees(self.angle))
                    .animation(.timingCurve(0, 0.8, 0.2, 1,duration : 10))
                
                Circle()
                    .fill(Color.white)
                    .frame(height: 50)
                    .shadow(radius: 5)
                
                Image(systemName: "arrowtriangle.up.fill")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .padding(.bottom,40)
            }
            
            Button(action: {
                self.angle += Double.random(in: 3600..<3960)
            }) {
                Text("回転する")
                    .font(.system(size: 24))
                    .foregroundColor(.gray)
            }
            .padding()
            
            Text("\(angle)")
                .foregroundColor(.gray)

          
            
            Spacer()
            
            
        }
       
            
    }
}

struct pieChart : View {
    
    @StateObject var vm = PieChartViewModel()
    
    var body: some View {
        
        ZStack {
            ForEach(0..<vm.data.count) { i in
                let currenrData = vm.data[i]
                let currentEndDegree = currenrData.percentage * 360
                let lastDegree = vm.data.prefix(i).map({$0.percentage}).reduce(0, +) * 360
                
                ZStack {
                    PieceofPie(startDegree: lastDegree, endDegree: lastDegree + currentEndDegree)
                        .fill(currenrData.color)
                    
                    GeometryReader { geo in
                        VStack {
                            Text(currenrData.description)
                                .font(.custom("Avenir", size: 20))
                                .foregroundColor(.white)
                               
                            
                            Text("\(Int(currenrData.percentage * 100)) %")
                                .foregroundColor(.white)
                               
                        }
                        .rotationEffect(.init(degrees: 45))
                        .position(getLabelCoodinate(in: geo.size, for: lastDegree + currentEndDegree / 2))
                        
                            

                    }
                }
                
                
            }
        }
        .rotationEffect(.init(degrees: -45))
        .frame(width: 300, height: 300)
    }
    
    private func getLabelCoodinate(in geoSize : CGSize, for degree : Double) -> CGPoint {
        
        let center = CGPoint(x: geoSize.width / 2, y: geoSize.height / 2)
        let radius = geoSize.width / 3
        
        let yCoodinate = radius * sin(CGFloat(degree) * CGFloat.pi / 180)
        let xCoodinate = radius * cos(CGFloat(degree) * CGFloat.pi / 180)
        
        return CGPoint(x: center.x + xCoodinate, y: center.y + yCoodinate)

    }
}



struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartView()
    }
}

