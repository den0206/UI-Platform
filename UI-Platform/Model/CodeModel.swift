//
//  CodeModel.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/11/25.
//

import Foundation
import SwiftUI
import CodeMirror_SwiftUI

final class CodeModel : ObservableObject {
    
    
    @Published var tabIndex : Int = 0
    @Published var showBording : Bool = true
    @Published var showTab : Bool = true
    @Published var typeIndex : Int = 0
    @Published var codeType : CodeType = CodeType.allCases.first ?? .WaveAnimation
    @Published var showHUD = false
    
    @AppStorage("fontSize") var fontSize : Int = 10
    
    /// start Theme - "birdsOfParadise"
    @AppStorage("themeIndex") var themeIndex : Int = 8
    
    var themes = CodeViewTheme.allCases.sorted {
        return $0.rawValue < $1.rawValue
    }
    
    var theme : CodeViewTheme {
        return themes[themeIndex]
    }
    
    private var allTypes = CodeType.allCases
    
    var interstitalView = InterstitalView()
    
    //MARK: - functions
    
    func nextPage() {
        
        guard typeIndex >= 0 else {return}
        
        if typeIndex < allTypes.count - 1{
            typeIndex += 1
            self.codeType = allTypes[typeIndex]
            
            if typeIndex % 3 == 0 {
                /// ad
                interstitalView.showAd()

            }
        }
        
        
    }
    
    func previewPage() {
        
        guard typeIndex > 0 else {return}
        
        typeIndex -= 1
        self.codeType = allTypes[typeIndex]
        
        if typeIndex % 3 == 0 {
            /// ad
            interstitalView.showAd()

        }
        
      
        

    }
    
    func setType(type : CodeType) {
        
        self.typeIndex = allTypes.firstIndex(of: type)!
        self.codeType = type
        
        /// change Tab
        self.tabIndex = 0
        
        if typeIndex % 3 == 0 {
            /// ad
            interstitalView.showAd()

        }
    
    }
    
    func copyText() {
        UIPasteboard.general.string = codeType.codeBlock
        showHUD = true
    }

}
