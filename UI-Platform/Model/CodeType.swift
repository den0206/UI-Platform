//
//  CodeType.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/11/25.
//

import Foundation
import SwiftUI

enum CodeType : CaseIterable, Identifiable{
    
    case JoyStick
    case StarAnimation
    case WaveAnimation
    case TemperatureControl
    case RippleAnimation
    case Isometric
    case CubeRotation
    case ColorPicker
    case StarRating
    case AnalogClock
    case CardType
    case ScrollEffect3D
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
        
        
        case .JoyStick :
            return "JoyStick"
        case .StarAnimation :
            return "Star Animation"
        case .WaveAnimation :
            return "Wave Animation"
        case .TemperatureControl :
            return "Temperature Control"
        case .RippleAnimation :
            return "Ripple Animation"
        case .Isometric :
            return "Isometric View"
        case .CubeRotation :
            return "Cube Rotaion"
        case .ColorPicker :
            return "Color picker"
        case .StarRating :
            return "Star Rating"
        case .AnalogClock :
            return  "Analog Clock"
        case .CardType :
            return "CardType"
        case .ScrollEffect3D :
            return "3DScrollEffect"
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
        
        case .JoyStick :
            return "https://www.youtube.com/watch?v=tJKAKnyy_68"
        case .StarAnimation :
            return "https://www.appcoda.com/star-wars-animated-text-swiftui/"
        case .WaveAnimation :
            return "https://www.youtube.com/watch?v=7bXQqnCFkFw"
        case .TemperatureControl :
            return "https://www.youtube.com/embed/yiQjoFTXR8o"
        case .RippleAnimation :
            return "https://www.youtube.com/embed/A68abUry2-Q"
        case .Isometric :
            return "https://trailingclosure.com/isometric-viewmodifier/"
        case.CubeRotation :
            return "https://trailingclosure.com/cube-rotation-transition/"
        case .ColorPicker :
            return "https://www.youtube.com/embed/tljAOx7tbKI"
        case .StarRating :
            return "https://trailingclosure.com/popup-review-button-using-swiftui/"
        case .CardType :
            return "https://www.youtube.com/embed/gHWmlxQueR4"
        case .ScrollEffect3D :
            return "https://trailingclosure.com/3d-scroll-effect/"
        case .LiquidSwipe :
            return "https://www.youtube.com/watch?v=BQrrNpgDbEg"
        default :
            return "https://www.google.com/"
        }
    }
    
    var description : String {
        switch self {
        
        default:
            return "No Description"
        }
    }
    var sourceName : String {
        switch self {
        
        
        case .JoyStick :
            return "JoyStickView"
        case .StarAnimation :
            return "StarAnimationView"
        case .WaveAnimation :
            return "WaveAnimationView"
        case .TemperatureControl :
            return "TemperatureControlView"
        case .RippleAnimation :
            return "RippleAnimationView"
        case .Isometric :
            return "IsometricView"
        case .CubeRotation :
            return "CubeRotationView"
        case .ColorPicker :
            return "ColorPickerView"
        case .StarRating :
            return "StarRatingView"
        case .AnalogClock :
            return "AnalogClockView"
        case .CardType :
            return "CardTypeView"
        case .ScrollEffect3D :
            return "ScrollEffect3DView"
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
        
        case .JoyStick :
            return AnyView(JoyStickView())
        case .StarAnimation :
            return AnyView(StarAnimationView())
        case .WaveAnimation :
            return AnyView(WaveAnimationView())
        case .TemperatureControl :
            return AnyView(TemperatureControlView())
        case .RippleAnimation :
            return AnyView(RippleAnimationView())
        case .Isometric :
            return AnyView(ExampleIsometricView())
        case .CubeRotation :
            return AnyView(CubeRotationView())
        case .ColorPicker :
            return AnyView(ColorPickerView())
        case .StarRating :
            return AnyView(StarRatingView())
        case .AnalogClock :
            return AnyView(AnalogClockView())
        case .CardType :
            return AnyView(CardTypeView())
        case .ScrollEffect3D :
            return AnyView(ScrollEffect3DView())
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
