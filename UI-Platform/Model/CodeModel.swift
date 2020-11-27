//
//  CodeModel.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/11/25.
//

import Foundation
import SwiftUI

 class CodeModel : ObservableObject {
    
    @Published var codeType : CodeType = .AnalogClock
    
    func nextCodeType() {
        
        switch codeType {
        case .AnalogClock :
            self.codeType = .PlaneButton
        case .PlaneButton :
            self.codeType = .Circle
        case .Circle :
            return
        }
    }
    
    func previewCodeType() {
        
        switch codeType {
        case .AnalogClock :
            return
        case .PlaneButton :
            self.codeType = .AnalogClock
        case .Circle :
            self.codeType = .PlaneButton
        }
    }
}
