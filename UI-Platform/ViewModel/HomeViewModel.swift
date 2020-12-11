//
//  HomeViewModel.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/12/11.
//

import SwiftUI

final class HomeViewModel : ObservableObject {
    
    @Published var showSideMenu = false
    @Published var fullScreen = false
    @Published var selectedIndex : Int = 0
    
    var viewWidth = UIScreen.main.bounds.width
    
    func selectedButton(type : CodeType, envModel : CodeModel) {
        /// selef.type = type

        withAnimation(.spring()) {
            showSideMenu.toggle()
            envModel.showTab = true
        }

        envModel.codeType = type
    }
    
    func fullScreenMode(envModel : CodeModel) {
        
        if fullScreen {
            
            DispatchQueue.main.async {
                AppDelegate.orientationLock = UIInterfaceOrientationMask.portrait
                UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
                UINavigationController.attemptRotationToDeviceOrientation()
                
                withAnimation(.spring()) {
                    envModel.showTab = true
                }
               
            }
            
           
            
        } else {
            DispatchQueue.main.async {
                AppDelegate.orientationLock = UIInterfaceOrientationMask.landscape
                UIDevice.current.setValue(UIInterfaceOrientation.landscapeLeft.rawValue, forKey: "orientation")
                UINavigationController.attemptRotationToDeviceOrientation()
                
                withAnimation(.spring()) {
                    envModel.showTab = false
                }
               
            }
            
            
            
            
        }
        
        fullScreen.toggle()
        
    }
}
