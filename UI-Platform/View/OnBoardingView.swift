//
//  OnBoardingView.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/11/29.
//

import SwiftUI

struct OnBoardingView: View {
    
    @EnvironmentObject var model : CodeModel

    @State private var maxWidth = UIScreen.main.bounds.width - 65
    @State private var offset : CGFloat = 0
    let capColor = Color.gray
    
    
    var body: some View {
       
        ZStack {
            
            /// Z1 Movie VIew
            LoopBackgroundView()
                .ignoresSafeArea(.all, edges: .all)
            
            /// Z2
            VStack {
                
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
                            .fill(capColor)
                            .frame(width: caluculateWidth() + 65)
                        
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
                        .background(capColor)
                        .clipShape(Circle())
                        .offset(x: offset)
                        .gesture(DragGesture().onChanged(onChange(value:)).onEnded(onEnded(value:)))
                        
                        Spacer()
                    }
                }
                .frame(width: maxWidth, height: 65)
        
                
            }
            .padding()
            
        }
    }
    
    //MARK: - Swipe Functions
    
    private func onChange(value : DragGesture.Value) {
        if value.translation.width > 0 && offset <= maxWidth - 65 {
            offset = value.translation.width
        }
    }
    
    private func onEnded(value : DragGesture.Value) {
        if offset > 180 {
            offset = maxWidth - 65
            model.showBording = false
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                offset = 0
            }
            
        } else {
            offset = 0
        }
    }
    
    //MARK: - functions
    
    private func caluculateWidth() -> CGFloat {
        
        let percent = offset / maxWidth
        return percent * maxWidth
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
