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
        
        //BUG: - No reflect toolbar color
        
        NavigationView {
            
            model.codeType.rootView
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        if !model.codeType.isFirst {
                            
                            Button(action: {model.previewCodeType()}) {
                                Image(systemName: "arrow.left.square.fill")
                                    .foregroundColor(.black)
                            }
                        }
                        
                        
                    }
                    
                   
                    ToolbarItem(placement: .navigationBarTrailing) {
                        if !model.codeType.isLast {
                            Button(action: {model.nextCodeType()}) {
                                Image(systemName: "arrow.right.square.fill")
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    
                }
                .highPriorityGesture(DragGesture().onEnded({ (value) in
                    
                    if (abs(value.translation.width) < 10) {return}
                    
                    if (value.translation.width < 0) {
                        model.previewCodeType()
                    } else {
                        model.nextCodeType()
                    }
                }))
            
                .navigationBarHidden(true)
                                
        }
        
       
    
    }
}

struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}
