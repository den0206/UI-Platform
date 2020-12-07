//
//  Extensions.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/11/29.
//

import Foundation
import SwiftUI
import UIKit

extension UIApplication {
    func closeKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension Color {
    
    static var random : Color{
        return Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))
    }
}

