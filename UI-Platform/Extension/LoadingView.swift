//
//  LoadingView.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/11/26.
//

import SwiftUI
import UIKit

extension View {
    
    func loading(ishowing : Binding<Bool>) -> some View {
        
        LoadingView(isShowing: ishowing, presenting: {self})
    }
    
    func showHUD(isShowing : Binding<Bool>, _ text : Text = Text("コピーしました！")) -> some View {
        HUDView(isShowing: isShowing, presenting: {
            self
        }, text: text)
    }
}

struct LoadingView<Presenting>: View where Presenting : View{
    
    @Binding var  isShowing : Bool
    let presenting: () -> Presenting
  
    
    var body: some View {
        
        
        ZStack(alignment: .center) {
            
            self.presenting()
                .background(Color.black.opacity(0.7).opacity(isShowing ? 1 : 0))
            
            
            VStack(spacing :4){
                
                ActivityIndicator(isAnimating: $isShowing, style: .large, color: .white)
                
                Text("Loading...")
                    .foregroundColor(.primary)
                    
                
            }
            .opacity((isShowing ? 1 : 0))
        
            
            
        }
        
        
    }
}

struct HUDView<Presenting> : View where Presenting : View {
    
    @Binding var  isShowing : Bool
    let presenting : () -> Presenting
    let text : Text
    
    var body: some View {
        
        if self.isShowing {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation() {
                    self.isShowing = false
                }
            }
        }
        
        return GeometryReader { geometry in
            
            ZStack(alignment: .center) {
                
                self.presenting()
                 .blur(radius: self.isShowing ? 1 : 0)

                /// black back
                if self.isShowing {

                    Color.primary.opacity(0.4)
                        .ignoresSafeArea(.all)
                }

                
                VStack {
                    self.text
                }
                .frame(width: geometry.size.width / 2,
                       height: geometry.size.height / 5)
                .background(Color.secondary.colorInvert())
                .foregroundColor(Color.primary)
                .cornerRadius(20)
                .transition(.slide)
                .opacity(self.isShowing ? 1 : 0)
                
            }
            
        }
        
        
    }
    
}


struct ActivityIndicator: UIViewRepresentable {
   @Binding var isAnimating: Bool
   let style: UIActivityIndicatorView.Style
   let color: UIColor
   func makeUIView(context _: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
       let indigatorView = UIActivityIndicatorView(style: style)
       indigatorView.color = color
       return indigatorView
   }
   func updateUIView(_ uiView: UIActivityIndicatorView, context _: UIViewRepresentableContext<ActivityIndicator>) {
       isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
   }
}

struct CustomLine : Shape {
    
   
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
       
        return path
    }
}
