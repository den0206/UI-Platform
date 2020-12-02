//
//  MainTabVIew.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/11/26.
//

import SwiftUI

struct MainTabView: View {
    
    @EnvironmentObject var model : CodeModel
    
    var body: some View {
        
        VStack {
            ZStack {
                switch model.tabIndex {
                
                case 0 :
                    ExampleView()
                    
                case 1 :
                    CodeListsView(isSheet: false)
        
                case 2 :
                    HomeView()
                
                default:
                    Color.white
                    Text("No View")
                }
            }
           
            if model.showTab{
                CircularTab(index: $model.tabIndex)
                    .frame(height: 70)
                    .animation(.spring())
                    
            }
        }
        .showHUD(isShowing: $model.showHUD)
        .edgesIgnoringSafeArea(.all)
        
        
    }
}

struct CircularTab : View {
    
    @Binding var index : Int
    
    var body: some View {
        
        HStack {
        
            tabButton(function: {index = 0}, systemImageName: "doc.richtext", title: "View", number: 0, index: index)
            
            Spacer(minLength : 15)
            
            tabButton(function: {index = 1}, systemImageName: "list.number", title: "Code List", number: 1, index: index)

            Spacer(minLength: 15)
            
            tabButton(function: {index = 2}, systemImageName: "chevron.left.slash.chevron.right", title: "Source", number: 2, index: index)
            
         
        }
        .padding(.top,-10)
        .padding(.horizontal,25)
        .background(Color(.systemGroupedBackground))
        .animation(.spring())
    }
}

struct tabButton : View {
    var function : ()->Void
    var systemImageName : String? = nil
    var imageName : String? = nil
    var title : String
    var number : Int
    var index : Int
    
    var picimage : Image {
        return systemImageName != nil ? Image(systemName: systemImageName!) : Image(imageName!)
    }
    var body: some View {
        VStack {
            Button(action: {self.function()}) {
                
                VStack {
                    
                    if index != number {
                        
                        if systemImageName != nil {
                            Image(systemName: systemImageName!)
                                .font(.system(size: 22))
                                .foregroundColor(.gray)
                                .padding(.top,3)
                            
                            
                        } else {
                            Image(imageName!)
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(.gray)
                                .frame(width: 30, height: 30)
                                .padding(.top,3)
                            
                        }
                        
                        
                        
                    } else {
                        
                        if systemImageName != nil {
                            Image(systemName: systemImageName!)
                                .frame(width: 25, height: 23)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.gray)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .offset(y : -5)
                                
                        } else {
                            Image(imageName!)
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(.white)
                                .frame(width: 30, height: 30)
                                .padding()
                                .background(Color.gray)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .offset(y : -20)
                                
                        }
                  
                    }
                    
                   
                        Text(title)
                            .foregroundColor(Color.primary.opacity(0.8))
                
                }
            }
            
           
               
            
          
        }
    }
    
}


struct MainTabVIew_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView().environmentObject(CodeModel())
    }
}
