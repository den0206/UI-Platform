//
//  DashboardView.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/11/29.
//

import SwiftUI

struct DashBoardView: View {
    
    //MARK: - Property
    @State private var index = 0
    
    var body: some View {
        
        VStack {
            HStack {
                Text("STAT")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                    
                Spacer()
            }
            .padding(.horizontal)
            
            //MARK: - Segment Control View
            
            HStack(spacing : 0) {
                
                Text("Day")
                    .foregroundColor(index == 0 ? .white : Color.gray.opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.horizontal,35)
                    .padding(.vertical,10)
                    .background(Color.purple.opacity(index == 0 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture(perform: {
                        
                        self.index = 0
                    })
                
                Spacer(minLength: 0)
                
                Text("Week")
                    .foregroundColor(index == 1 ? .white : Color.gray.opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.horizontal,35)
                    .padding(.vertical,10)
                    .background(Color.purple.opacity(index == 1 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture(perform: {
                        
                        self.index = 1
                    })
                
                Spacer(minLength: 0)
                
                Text("Month")
                    .foregroundColor(index == 2 ? .white : Color.gray.opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.horizontal,35)
                    .padding(.vertical,10)
                    .background(Color.purple.opacity(index == 2 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture(perform: {
                        
                        self.index = 2
                    })
                
                
                
                        
            }
            .background(Color.black.opacity(0.4))
            .clipShape(Capsule())
            .padding(.horizontal)
            .padding(.top,10)
            
            //MARK: - Grid View
            
            TabView(selection: $index, content:  {
                
                /// daily tag-0
                
                GridView(fitnessData: fit_Data)
                    .tag(0)
                
                /// weekly tag-1
                GridView(fitnessData: week_Fit_Data)
                    .tag(1)
                
                /// no monthly data tag-2

                VStack {
                    Text("Monthly View")
                }
                .tag(2)
                
                
            })
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            Spacer(minLength: 0)
            
        }
        .padding(.top)
    }
}

fileprivate struct GridView : View {
    
    var fitnessData : [Fitness]
    var columms = Array(repeating: GridItem(.flexible(),spacing: 20), count: 2)
    
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columms, spacing: 30, content:{
                
                ForEach(fitnessData) { fitness in
                    
                    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top), content: {
                        
                        /// Z1
                        VStack(alignment: .leading, spacing: 20, content: {
                            Text(fitness.title)
                                .foregroundColor(.white)
                            
                            Text(fitness.data)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.top,10)
                            
                            HStack {
                                Spacer(minLength: 0)
                                
                                Text(fitness.suggest)
                                    .foregroundColor(.white)
                            }
                        })
                        .padding()
                        .background(Color.random)
                        .cornerRadius(20)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 5)
                        
                        
                        /// Z2
                        Image(systemName: "heart")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.white.opacity(0.2))
                            .clipShape(Circle())
                        
                    })
                    
                }
            })
            .padding(.horizontal)
            .padding(.top,25)
        }
        
      
    }
}

fileprivate struct Fitness : Identifiable {
    
    var id: Int
    var title : String
    var image : String
    var data : String
    var suggest : String
    
    
}

fileprivate var fit_Data = [
    
    
    Fitness(id: 0, title: "Heart Rate", image: "heart", data: "124 bpm",suggest: "80-120 \n Healthy"),

    Fitness(id: 1, title: "Sleep", image: "sleep", data: "6h 43m", suggest: "Deep Sleep \n 5h 13m"),
    
    Fitness(id: 2, title: "Energy Burn", image: "energy", data: "583 kcal", suggest: "Daily Goal \n 900 kcal"),
            
    Fitness(id: 3, title: "Steps", image: "steps", data: "16,741", suggest: "Daily Goal \n 20,000 Steps"),
    
    Fitness(id: 4, title: "Running", image: "running", data: "5.3 km", suggest: "Daily Goal \n 10 km"),
    
    Fitness(id: 5, title: "Cycling", image: "cycle", data: "15.3 km", suggest: "Daily Goal \n 20 km"),
]

fileprivate var week_Fit_Data = [

    Fitness(id: 0, title: "Heart Rate", image: "heart", data: "84 bpm", suggest: "80-120 \n Healthy"),

    Fitness(id: 1, title: "Sleep", image: "sleep", data: "43h 23m", suggest: "Deep Sleep \n 26h 13m"),
    
    Fitness(id: 2, title: "Energy Burn", image: "energy", data: "3,500 kcal", suggest: "Weekly Goal \n 4,800 kcal"),
            
    Fitness(id: 3, title: "Steps", image: "steps", data: "17,8741", suggest: "Weekly Goal \n 25,0000 Steps"),
    
    Fitness(id: 4, title: "Running", image: "running", data: "45.3 km", suggest: "Weekly Goal \n 70 km"),
    
    Fitness(id: 5, title: "Cycling", image: "cycle", data: "100.3 km", suggest: "Weekly Goal \n 125 km"),
]

