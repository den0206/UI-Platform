//
//  PlaneButton.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/11/26.
//

import SwiftUI

struct PlaneButtonView: View {
    @State private var labelText = "hello world"
    @State private var tapped = false
    var body: some View {
        VStack {
            Spacer()
            
            Text(labelText)
                .font(.largeTitle)
                .padding(.bottom)
            
            Button(action: {
                
                if tapped {
                    self.labelText = "Tapped!"
                } else {
                    self.labelText = "hello world"
                }
                
                tapped.toggle()
                
            }) {
                Text("Button")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
            .padding()
            .background(Color.blue)
            
            Spacer()
        }
    }
}

struct PlaneButton_Previews: PreviewProvider {
    static var previews: some View {
        PlaneButtonView()
    }
}
