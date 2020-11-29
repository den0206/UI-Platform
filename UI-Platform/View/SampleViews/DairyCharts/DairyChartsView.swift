//
//  DairyChartsView.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/11/29.
//

import Foundation
import SwiftUI


//MARK: - Dairy Charts


struct DairyChartsView: View {
    
    @State private var selected = 0
    private var colums = Array(repeating: GridItem(.flexible()), count: 2)
    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack {
                
                HStack {
                    Text("Daily Charts")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer(minLength: 0)
                    
                    Button {
                        return
                    } label: {
                        Image(systemName: "list.bullet")
                            .font(.system(size: 22))
                            .foregroundColor(.white)
                    }

                }
                .padding()
                
                //MARK: - Charts View
                
                VStack(alignment: .leading, spacing: 25) {
                    
                    Text("Daily Workout")
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    HStack(spacing : 15) {
                        
                        ForEach(woukout_Data) { work in
                            
                            VStack {
                                
                                VStack {
                                    Spacer(minLength: 0)
                                    
                                    if selected == work.id {
                                        Text(getHrs(value: work.workout_In_Min))
                                            .foregroundColor(.white)
                                            .padding(.bottom , 5)
                                    }
                                    
                                    RoundedShape()
                                        .fill(LinearGradient(gradient: .init(colors: selected == work.id ? [Color.blue, Color.purple] :[Color.white.opacity(0.06)]), startPoint: .top, endPoint: .bottom))
                                        .frame( height: getHeight(value: work.workout_In_Min))
                                }
                                .frame(height: 200)
                                .onTapGesture {
                                    withAnimation {
                                        selected = work.id
                                    }
                                }
                                
                                Text(work.day)
                                    .font(.caption)
                                    .foregroundColor(.white)
                            }
                            
                        }
                        
                    }
                }
                .padding()
                .background(Color.white.opacity(0.06))
                .cornerRadius(10)
                .padding()
                
                HStack {
                    Text("Statistics")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer(minLength: 0)
                }
                
                //MARK: - Grid VIew
                
                LazyVGrid(columns: colums, spacing: 30) {
                    
                    ForEach(stats_Data) { stat in
                        
                        VStack(spacing : 32) {
                            
                            HStack {
                                Text(stat.title)
                                    .font(.system(size: 22))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                                Spacer(minLength: 0)
                            }
                            
                            /// Circle
                            ZStack {
                                
                                /// base circle
                                Circle()
                                    .trim(from: 0, to: 1)
                                    .stroke(stat.color.opacity(0.05), lineWidth: 10)
                                    .frame(width: (UIScreen.main.bounds.width - 150) / 2, height: (UIScreen.main.bounds.height - 150) / 2)
                                
                                
                                Circle()
                                    .trim(from: 0, to: stat.currentData / stat.goal)
                                    .stroke(stat.color, style : StrokeStyle(lineWidth: 10, lineCap: .round))
                                    .frame(width: (UIScreen.main.bounds.width - 150) / 2, height: (UIScreen.main.bounds.height - 150) / 2)
                                
                                /// center Text
                                
                                Text(getPercentage(current: stat.currentData, goal: stat.goal) + "%")
                                    .font(.system(size: 22))
                                    .fontWeight(.bold)
                                    .foregroundColor(stat.color)
                                    .rotationEffect(.init(degrees: 90))
                                
                            }
                            .rotationEffect(.init(degrees: -90))
                            
                            Text(getDec(val: stat.currentData) + " / " + getDec(val: stat.goal))
                                .font(.system(size: 22))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        .padding()
                        .background(Color.white.opacity(0.06))
                        .cornerRadius(15)
                        .shadow(color: Color.white.opacity(0.2), radius: 10, x: 0, y: 0)
                        
                        
                    }
                    
                }
                
            }
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

extension DairyChartsView {
    
    private func getHrs(value : CGFloat) -> String {
        
        let hrs = value / 60
        return String(format: "%.1f", hrs)
    }
    
    private func getHeight(value : CGFloat) -> CGFloat {
        let hrs = CGFloat(value / 1440) * 200
        return hrs
    }
    
    private func getPercentage(current : CGFloat, goal: CGFloat) -> String {
        let per = (current / goal) * 100
        return String(format: "%.1f", per)
    }
    
    private func getDec(val : CGFloat) -> String {
        
        let format = NumberFormatter()
        format.numberStyle = .decimal
        
        return format.string(from: NSNumber.init(value: Float(val)))!
    }
}



struct RoundedShape : Shape {
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 5, height: 5))
        return Path(path.cgPath)
    }
}

//MARK: - Datas

struct Daily : Identifiable {
    
    var id : Int
    var day : String
    var workout_In_Min : CGFloat
}

var woukout_Data = [
    Daily(id: 0, day: "Day 1", workout_In_Min: 500),
    Daily(id: 1, day: "Day 2", workout_In_Min: 330),
    Daily(id: 2, day: "Day 2", workout_In_Min: 720),
    Daily(id: 3, day: "Day 3", workout_In_Min: 630),
    Daily(id: 4, day: "Day 4", workout_In_Min: 450),
    Daily(id: 5, day: "Day 5", workout_In_Min: 120),
    Daily(id: 6, day: "Day 6", workout_In_Min: 360),

]


struct  Stats : Identifiable {
    var id : Int
    var title : String
    var currentData : CGFloat
    var goal : CGFloat
    var color : Color = Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
}


var stats_Data = [
    Stats(id: 0, title: "Running", currentData: 6.8, goal: 15, color: Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))),
    Stats(id: 1, title: "Swiminng", currentData: 4.8, goal: 15, color: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))),
    Stats(id: 2, title: "Energy", currentData: 5.5, goal: 45, color: Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))),
    Stats(id: 3, title: "Sleep", currentData: 6.2, goal: 45, color: Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1))),
    Stats(id: 4, title: "Cycling", currentData: 3.8, goal: 15, color: Color(#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1))),
    Stats(id: 5, title: "Steps", currentData: 6.4, goal: 15, color: Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))),
]



