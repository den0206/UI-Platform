//
//  ExampleView.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/11/25.
//

import SwiftUI

struct ExampleView: View {
    
    enum exampleSheetView : Identifiable {
        
        case list
        case description
        
        var id  : Int{
            return hashValue
        }
    }
    
    @EnvironmentObject var model : CodeModel
    @State private var viewX : CGFloat = 0
    @State private var sheetView : exampleSheetView?
    

    var body: some View {
        
        NavigationView {
            
                model.codeType.rootView
                    .offset(x: viewX)
                    .gesture(DragGesture()
                           .onChanged({ (value) in
                               
                               viewX = value.translation.width
                           })
                           .onEnded({ (value) in
                               
                               if (abs(value.translation.width) < 10) {return}
                               
                               if (value.translation.width > 0) {
                                   model.previewPage()
                                   
                               } else {
                                   model.nextPage()
                                   
                               }
                               
                               viewX = 0
                           }))
                    .sheet(item: $sheetView, content: { (item) in
                        
                        switch item {
                        
                        case .list :
                            CodeListsView()
                        case  .description :
                            DescriptionView()
                        }
                    })
             
          
                .navigationBarItems(leading:
                  HStack(spacing :4) {
                      
                      Button(action: {model.previewPage()}) {
                          Image(systemName: "arrow.left.square.fill")
                              .foregroundColor(.primary)
                              .opacity(model.codeType.isFirst ? 0 : 1)
                          
                        Button(action: {self.sheetView = .list}) {
                              Image(systemName: "list.number")
                                  .foregroundColor(.primary)
                          }
                          
                      }
                      
                  },trailing:
                    
                    HStack(spacing :4) {
                        Button(action: {
//                                self.sheetView = .description
                            model.tabIndex = 2
                            
                        }) {
                              Image(systemName: "text.bubble")
                                  .foregroundColor(.primary)
                          }
                        
                        Button(action: {model.nextPage()}) {
                            Image(systemName: "arrow.right.square.fill")
                                .foregroundColor(.primary)
                                .opacity(model.codeType.isLast ? 0 : 1)
                        }
                    }
                     
                )
                
                
                .navigationTitle(model.codeType.title)
                .navigationBarTitleDisplayMode(.inline)
        }
        
        
        
    }
}

struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}
