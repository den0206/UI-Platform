//
//  HomeView.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/11/24.
//

import SwiftUI
import CodeMirror_SwiftUI


struct HomeView: View {
    
    @EnvironmentObject var model : CodeModel
    @StateObject var vm = HomeViewModel()

    var width = UIScreen.main.bounds.width


    var body: some View {
        
        if !vm.fullScreen {
            
             ZStack {
                 /// Z1
                 VStack {
                     HStack {
                         Button(action: {
                            vm.fullScreenMode(envModel: model)
 
                         }) {
                             Image(systemName: "arrow.up.left.and.arrow.down.right")
                                .font(.system(size: 24))
                                .foregroundColor(.primary)
                         }
                        
                        Spacer()
                        
                        Button(action: {model.copyText()}) {
                            Image(systemName: "paperclip")
                                .font(.system(size: 24))
                                .foregroundColor(.primary)
                        }
                        .padding(.trailing,4)
                      

                         Button(action: {
                             withAnimation(.spring()) {
                                vm.showSideMenu.toggle()
                                 model.showTab = false
                             }
                         }, label: {
                             Image(systemName: "line.horizontal.3")
                                 .font(.system(size: 24))
                                 .foregroundColor(.primary)
                         })

                     }
                     .padding()
                     .padding(.top , 6)
                     .background(Color.clear)
                     .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                     
                     
                     SourceView(codeType: model.codeType)
                       
                   

                 
                 }
                 
                 
                 /// Z2
                 HStack(spacing :20) {
                     Spacer()

                     VStack {
                         HStack {
                             Spacer()
                             Button(action: {
                                 withAnimation(.spring()) {
                                    vm.showSideMenu.toggle()
                                     model.showTab = true
                                 }
                             }, label: {
                                 Image(systemName: "xmark")
                                     .font(.system(size: 22, weight : .bold))
                                     .foregroundColor(.black)
                             })
                         }
                         .padding()
                         .padding(.top, 4)
                         
                         VStack(spacing :4) {
                             
                             Text("Font Size")
                                 .underline()
                                
                             Picker(selection: $model.fontSize, label: Text("")) {
                                 ForEach(4 ..< 25, id : \.self) { i in
                                     Text("\(i)")
                                         .foregroundColor(.black)
                                 }
                             }
                             
                             .labelsHidden()
                
                             Text("Code Theme")
                                 .underline()
                             
                             Picker(selection: $model.themeIndex, label: Text("")) {
                                 ForEach(0 ..< model.themes.count) { i in
                                     Text("\(model.themes[i].rawValue)")
                                         .foregroundColor(.black)
                                 }
                             }
                            
                         
                             .labelsHidden()
                             
                         }
                         .foregroundColor(.black)
                         
                         .padding(.top)
                         .padding(.leading, 40)


                         Spacer()

                     }
                     .frame(width : width - 100)
                     .background(Color.gray)
                     .offset(x: vm.showSideMenu ? 0 : width - 100)
                 }
                 .background(Color.black.opacity(vm.showSideMenu ? 0.3 : 0).onTapGesture {
                     withAnimation(.spring()) {
                         vm.showSideMenu.toggle()
                         model.showTab = true
                     }

                 })
                 
             }
             .gesture(DragGesture().onEnded(leftRightValue(value:)))
             .ignoresSafeArea(.all, edges: .all)
             
            
        } else {
            
            /// Full Lansdscape Model
            
            ZStack {
                
                SourceView(codeType: model.codeType)

                if vm.fullScreen{
                    
                    VStack {
                        
                        Spacer()
                        
                        HStack {
                            Spacer()
                            
                            Button(action: {
                                vm.fullScreenMode(envModel: model)
    
                            }) {
                                Image(systemName: "arrow.down.right.and.arrow.up.left")
                                   .font(.system(size: 24))
                                   .foregroundColor(.primary)
                            }
                           
                            .padding()
                        }
                    
                        
                        
                    }
                }
            }
        }
       
    }

    /// left & Right Swipe
    
    private func leftRightValue(value : DragGesture.Value) {
        
        
          if (abs(value.translation.width) < 10) {return}
          
          if (value.translation.width < 0) {
              withAnimation(.spring()) {
                vm.showSideMenu = true
                  model.showTab = false
            
              }
          } else {
              withAnimation(.spring()) {
                vm.showSideMenu = false
                  model.showTab = true
              }
          }
    }
    
    /// up & down scroll
    
    private func upDownValue(value : DragGesture.Value) {
        if value.startLocation.y < value.location.y{
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
                withAnimation(.spring()) {
                    print("call")
                    model.showTab = true
                }
            }
        }
        if value.startLocation.y > value.location.y{
        
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
                withAnimation(.spring()) {

                    model.showTab = false
                }
            }
            
        }

    }

}

struct MenuButton : View {
    
    var action : () -> Void
    var type : CodeType
    
    var body: some View {
        
        Button(action: {action()}, label: {
            Text(type.title)
                .font(.title2)
                .fontWeight(.semibold)
        })
        .padding()
        .foregroundColor(.white)
    }
}

