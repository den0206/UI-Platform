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
    case PieChart
    case Circular_Slider
    case DairyChart
    case DashBoard
    
    var id : Int {
        hashValue
    }
    
    var title : String {
        switch self {
        
        case .AnalogClock :
            return  "Analog Clock"
        case .PieChart:
            return "Pie Chart"
        case .Circular_Slider:
            return "Circular Slider"
        case .DairyChart :
            return "Dairy Charts"
        case .DashBoard :
            return "Dash Board"
        }
    }
    
    var sourceName : String {
        switch self {
        
        case .AnalogClock :
            return "AnalogClockView"
        case .PieChart :
            return "PieChartView"
        case .Circular_Slider :
            return "Circular_SliderView"
        case .DairyChart :
            return "Dairy_ChartsView"
        case . DashBoard :
            return "DashboardView"
     
        }
    }
    
    var rootView : AnyView {
        
        switch self {
        case .AnalogClock :
            return AnyView(AnalogClockView())
        case .PieChart:
             return AnyView(PieChartView())
        case .Circular_Slider :
            return AnyView(Circular_SliderView())
        case .DairyChart :
            return AnyView(DairyChartsView())
        case . DashBoard :
            return AnyView(DashBoardView())
    
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
