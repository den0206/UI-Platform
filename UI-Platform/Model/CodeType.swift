//
//  CodeType.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/11/25.
//

import Foundation

enum CodeType : CaseIterable, Identifiable{
    
    case Button
    case Circle
    
    var id : Int {
        hashValue
    }
    
    var title : String {
        switch self {
        
        case .Button:
            return "Button"
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
    
    var codeBlock : String {
        
        
        return try! String(contentsOf: Bundle.main.url(forResource: sourceName, withExtension: "txt")!)
        
//        String(contentsOf: Bundle.main.url(forResource: sourceName, withExtension: "swift")!)
    }
    
    
}
