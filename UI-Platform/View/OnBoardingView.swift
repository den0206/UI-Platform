//
//  OnBoardingView.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/11/29.
//

import SwiftUI

struct OnBoardingView: View {
    
    @EnvironmentObject var model : CodeModel
    @StateObject var vm = OnBordingViewModel()
    
    var body: some View {
       
        ZStack {
            
            /// Z1 Movie VIew
            LoopBackgroundView()
                .ignoresSafeArea(.all, edges: .all)
            
            /// Z2
            VStack {
                
           
                Spacer()
                
                IsometricView(active: true, extruded: true, depth: 30) {
                    Rectangle().fill(LinearGradient(gradient: .init(colors: [vm.ranColor, Color.primary]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: 200, height: 200)
                        .overlay(
                            
                            Text("Write Your Code")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .shadow(color: Color.black.opacity(0.6), radius: 3, x: 15, y: 20)
                                .opacity(vm.textOpacity)
                                .onAppear(perform: {
                                    withAnimation(.easeInOut(duration: 2.0)) {
                                        vm.textOpacity = 1.0
                                    }
                                })
                            
                        )
                       
                }
               
             
                
                Spacer()
                
                ZStack {
                    Capsule()
                        .fill(Color.white.opacity(0.1))
                    
                    Text("Swipe To Start")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.leading, 30)
                    
                    
                    HStack {
                        
                        Capsule()
                            .fill(vm.capColor)
                            .frame(width: vm.caluculateWidth() + 65)
                        
                        Spacer()
                        
                    }
                    
                    HStack {
                        ZStack {
                            Image(systemName: "chevron.right")
                            
                            Image(systemName: "chevron.right")
                                .offset(x: -10)
                        }
                        .foregroundColor(.white)
                        .offset(x: 5)
                        .frame(width: 65, height: 65)
                        .background(vm.capColor)
                        .clipShape(Circle())
                        .offset(x: vm.offset)
                        .gesture(DragGesture().onChanged(onChange(value:)).onEnded(onEnded(value:)))
                        
                        Spacer()
                    }
                }
                .frame(width: vm.maxWidth, height: 65)
                
                AdBannerView()
                    .frame(width: 320, height: 50, alignment: .center)
                    .padding(.bottom, 5)
        
                
            }
            .padding()
       
            
        }
    }
    
    //MARK: - Swipe Functions
    
    private func onChange(value : DragGesture.Value) {
        if value.translation.width > 0 && vm.offset <= vm.maxWidth - 65 {
            vm.offset = value.translation.width
        }
    }
    
    private func onEnded(value : DragGesture.Value) {
        if vm.offset > 180 {
            vm.offset = vm.maxWidth - 65
            model.showBording = false
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                vm.offset = 0
            }
            
        } else {
            vm.offset = 0
        }
    }
    
  
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
