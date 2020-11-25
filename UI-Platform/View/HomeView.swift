//
//  HomeView.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/11/24.
//

import SwiftUI


struct HomeView: View {
    
    @EnvironmentObject var model : CodeModel
    
    @State private var showSideMenu = false
    @State private var selectedIndex : Int = 0
    
    private var width = UIScreen.main.bounds.width
    
    var body: some View {
        
        ZStack {
            
            /// Z1
            VStack {
                HStack {
                    Spacer()
                    
                    Button(action: {
                        withAnimation(.spring()) {
                            showSideMenu.toggle()
                        }
                    }, label: {
                        Image(systemName: "line.horizontal.3")
                            .font(.system(size: 22))
                            .foregroundColor(.gray)
                    })
                    
                }
                .padding()
                .padding(.top , 6)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                
                Spacer()
                
                SourceView(codeType: model.codeType)
                
                Spacer()
            }
            
            
            /// Z2
            HStack(spacing :20) {
                Spacer()
                
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            withAnimation(.spring()) {
                                showSideMenu.toggle()
                            }
                        }, label: {
                            Image(systemName: "xmark")
                                .font(.system(size: 22, weight : .bold))
                                .foregroundColor(.black)
                        })
                    }
                    .padding()
                    .padding(.top, 4)
                    
                    ScrollView {
                        
                        ForEach(CodeType.allCases) { type in
                            
                            MenuButton(action: {selectedButton(type: type)}, type: type)
                            
                        }
                    }
                    .padding(.top)
                    .padding(.leading, 40)
                    
                    
                    Spacer()
                    
                }
                .frame(width : width - 100)
                .background(Color.gray)
                .offset(x: showSideMenu ? 0 : width - 100)
            }
            .background(Color.black.opacity(showSideMenu ? 0.3 : 0).onTapGesture {
                withAnimation(.spring()) {
                    self.showSideMenu.toggle()
                }
                
            })
            
        }
        .ignoresSafeArea(.all, edges: .all)
    }
    
    
    //MARK: -
    
    private func selectedButton(type : CodeType) {
        
        /// selef.type = type
        
        withAnimation(.spring()) {
            self.showSideMenu.toggle()
        }
        
        self.model.codeType = type
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
