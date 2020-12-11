//
//  OnBordingViewModel.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/12/11.
//

import Foundation
import SwiftUI

final class OnBordingViewModel: ObservableObject {
    
    @Published var maxWidth = UIScreen.main.bounds.width - 65
    @Published var offset : CGFloat = 0
    @Published var textOpacity : Double = 0
    
    let capColor = Color.gray
    let ranColor = Color.random
    

    //MARK: - functions
    
    func caluculateWidth() -> CGFloat {
        
        let percent = offset / maxWidth
        return percent * maxWidth
    }
}
