//
//  UI_PlatformApp.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/11/24.
//

import SwiftUI

@main
struct UI_PlatformApp: App {
    
    @StateObject var  model = CodeModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView().environmentObject(model)
        }
    }
}
