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
    
    @Published var typeIndex : Int = 0
    @Published var codeType : CodeType = CodeType.allCases.first!
    
    @Published var theme : CodeViewTheme = .birdsOfParadise
    
    private var allTypes = CodeType.allCases
    
    func nextPage() {
        
        guard typeIndex >= 0 else {return}
        
        if typeIndex < allTypes.count - 1{
            typeIndex += 1
            self.codeType = allTypes[typeIndex]
        }
    }
    
    func previewPage() {
        
        guard typeIndex > 0 else {return}
        
        typeIndex -= 1
        self.codeType = allTypes[typeIndex]
        

    }
    
    func setType(type : CodeType) {
        
        self.typeIndex = allTypes.firstIndex(of: type)!
        self.codeType = type
    
    }
}
