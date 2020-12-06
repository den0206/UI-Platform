//
//  UI_PlatformApp.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/11/24.
//

import SwiftUI
import GoogleMobileAds

@main
struct UI_PlatformApp: App {
    
    init() {
        GADMobileAds.sharedInstance().start(completionHandler: nil)
    }
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var  model = CodeModel()
    
    var body: some Scene {
        WindowGroup {
            RootView().environmentObject(model)
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    
    static var orientationLock = UIInterfaceOrientationMask.portrait

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        return true
    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.orientationLock
    }
}
