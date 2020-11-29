//
//  Extensions.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/11/29.
//

import Foundation
import UIKit

extension UIApplication {
    func closeKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
