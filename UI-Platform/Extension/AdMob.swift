//
//  AdMob.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/12/05.
//

import SwiftUI
import GoogleMobileAds

struct AdBannerView : UIViewRepresentable {
    
    func makeUIView(context: Context) -> some GADBannerView {
        
         let banner = GADBannerView(adSize: kGADAdSizeBanner)
        /// id
        banner.adUnitID = testMode ? AdMobKey.BannerId.testKey : AdMobKey.BannerId.banner1
        banner.rootViewController = UIApplication.shared.windows.first?.rootViewController
        banner.load(GADRequest())
        
        return banner
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}


final class InterstitalView : NSObject, GADInterstitialDelegate {
    
    
    var interstital = GADInterstitial(adUnitID: testMode ? AdMobKey.InterstitalId.testKey : AdMobKey.InterstitalId.interstital1)
    
    override init() {
        super.init()
        
        loadInterstital()
        
    }
    
    private func loadInterstital() {
        
        self.interstital.load(GADRequest())
        self.interstital.delegate = self
    }
    
    func showAd() {
        if self.interstital.isReady {
            let root = UIApplication.shared.windows.first?.rootViewController
            self.interstital.present(fromRootViewController: root!)
        } else {
            
            print("No Raady")
        }
    }
    
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        self.interstital = GADInterstitial(adUnitID: testMode ? AdMobKey.InterstitalId.testKey : AdMobKey.InterstitalId.interstital1)
        
        loadInterstital()
        
    }
}
