//
//  CodeType.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/11/25.
//

import Foundation
import SwiftUI

enum CodeType : CaseIterable, Identifiable{
    
    case PlaneButton
    case Circle
    
    var id : Int {
        hashValue
    }
    
    var title : String {
        switch self {
        
        case .PlaneButton:
            return "Plane Button"
        case .Circle:
            return "Circle"
        }
    }
    
    var sourceName : String {
        switch self {
        default :
            return "Demo"
        }
    }
    
    var rootView : AnyView {
        switch self {
        case .PlaneButton:
             return AnyView(PlaneButtonView())
        default:
            return AnyView(Text("No View"))
        }
    }
    
    var codeBlock : String {
        
        
        return try! String(contentsOf: Bundle.main.url(forResource: sourceName, withExtension: "txt")!)
        
//        String(contentsOf: Bundle.main.url(forResource: sourceName, withExtension: "swift")!)
    }
    
    
}
