//
//  RootView.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/11/25.
//

import SwiftUI

struct RootView: View {
    
    @EnvironmentObject var model : CodeModel
    
    var body: some View {
        
        
        if model.showBording {
            OnBoardingView()
        } else {
            MainTabView()
        }
    
        
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
