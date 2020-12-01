//
//  CodeType.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/11/25.
//

import Foundation
import SwiftUI

enum CodeType : CaseIterable, Identifiable{
    
    case WaveAnimation
    case AnalogClock
    case LiquidSwipe
    case PieChart
    case Circular_Slider
    case DairyChart
    case DashBoard
    case VgridSearch
    
    var id : Int {
        hashValue
    }
    
    var title : String {
        switch self {
        
        case .WaveAnimation :
            return "Wave Animation"
        case .AnalogClock :
            return  "Analog Clock"
        case .LiquidSwipe:
            return "LiquidSwipeView"
        case .PieChart:
            return "Pie Chart"
        case .Circular_Slider:
            return "Circular Slider"
        case .DairyChart :
            return "Dairy Charts"
        case .DashBoard :
            return "Dash Board"
        case .VgridSearch :
            return "Vgrid Search"
        }
    }
    
    var relationUrlString : String {
        switch self {
        
        case .WaveAnimation :
            return "https://www.youtube.com/watch?v=7bXQqnCFkFw"
        case .LiquidSwipe :
            return "https://www.youtube.com/watch?v=BQrrNpgDbEg"
        default :
            return "https://www.google.com/"
        }
    }
    
    var sourceName : String {
        switch self {
        
        case .WaveAnimation :
            return "WaveAnimationView"
        case .AnalogClock :
            return "AnalogClockView"
        case .LiquidSwipe:
            return "LiquidSwipeView"
        case .PieChart :
            return "PieChartView"
        case .Circular_Slider :
            return "Circular_SliderView"
        case .DairyChart :
            return "Dairy_ChartsView"
        case . DashBoard :
            return "DashboardView"
        case .VgridSearch :
            return "VgridSearchView"
     
        }
    }
    
    var rootView : AnyView {
        
        switch self {
        
        case .WaveAnimation :
            return AnyView(WaveAnimationView())
        case .AnalogClock :
            return AnyView(AnalogClockView())
        case .LiquidSwipe :
            return AnyView(LiquidSwipeView())
        case .PieChart:
             return AnyView(PieChartView())
        case .Circular_Slider :
            return AnyView(Circular_SliderView())
        case .DairyChart :
            return AnyView(DairyChartsView())
        case . DashBoard :
            return AnyView(DashBoardView())
        case . VgridSearch :
            return AnyView(LazyVgridSearchView())
    
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
