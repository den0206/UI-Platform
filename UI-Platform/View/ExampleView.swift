//
//  ExampleView.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/11/25.
//

import SwiftUI

struct ExampleView: View {
    
    @EnvironmentObject var model : CodeModel
    
    var body: some View {
                
        NavigationView {
            
            model.codeType.rootView
                .navigationBarItems(leading:
                  Button(action: {model.previewPage()}) {
                    Image(systemName: "arrow.left.square.fill")
                        .foregroundColor(.primary)
                        .opacity(model.codeType.isFirst ? 0 : 1)
                  },trailing:
                    Button(action: {model.nextPage()}) {
                        Image(systemName: "arrow.right.square.fill")
                            .foregroundColor(.primary)
                            .opacity(model.codeType.isLast ? 0 : 1)
                    }
                )
                .highPriorityGesture(DragGesture().onEnded({ (value) in
                    
                    if (abs(value.translation.width) < 10) {return}
                    
                    if (value.translation.width < 0) {
                        model.previewPage()
                    } else {
                        model.nextPage()
                    }
                }))
                
                .navigationBarTitleDisplayMode(.inline)
        }
        
       
    
    }
}

struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}
