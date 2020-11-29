//
//  LoopBackgroundView.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/11/29.
//

import SwiftUI

struct LoopBackgroundView: View {
    var body: some View {
        LoopMovieView()
            .overlay(Color.white.opacity(0.5))
            .blur(radius: 1)
            .edgesIgnoringSafeArea(.all)
    }
}

