//
//  CodeType.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/11/25.
//

import Foundation
import SwiftUI

enum CodeType : CaseIterable, Identifiable{
    
    case AnalogClock
    case PlaneButton
    case Circle
    
    var id : Int {
        hashValue
    }
    
    var title : String {
        switch self {
        
        case .AnalogClock :
            return  "Analog Clock"
        
        case .PlaneButton:
            return "Plane Button"
        case .Circle:
            return "Circle"
        }
    }
    
    var sourceName : String {
        switch self {
        
        case .AnalogClock :
            return "AnalogClockView"
        case .PlaneButton :
            return "PlaneButtonView"
        default :
            return "Demo"
        }
    }
    
    var rootView : AnyView {
        switch self {
        case .AnalogClock :
            return AnyView(AnalogClockView())
        case .PlaneButton:
             return AnyView(PlaneButtonView())
        default:
            return AnyView( VStack {Spacer(); Text("No Vew"); Spacer()})
        }
    }
    
    var codeBlock : String {
        
        var fileSorce : URL
        
        if let file = Bundle.main.url(forResource: sourceName, withExtension: "txt")  {
            
            fileSorce = file
        } else {
            print("No Swift File")
            fileSorce = Bundle.main.url(forResource: "Demo", withExtension: "txt")!
        }
        
        
        return try! String(contentsOf: fileSorce)
        

    }
    
    var isFirst : Bool {
        return self == CodeType.allCases.first
    }
    
    var isLast : Bool {
        return self == CodeType.allCases.last
    }
    
    
}
