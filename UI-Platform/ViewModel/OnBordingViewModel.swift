//
//  OnBordingViewModel.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/12/11.
//

import Foundation
import SwiftUI

final class OnBordingViewMode: ObservableObject {
    
    @Published var maxWidth = UIScreen.main.bounds.width - 65
    @Published var offset : CGFloat = 0
    @State private var textOpacity : Double = 0
    
    let capColor = Color.gray
    let ranColor = Color.random
}
