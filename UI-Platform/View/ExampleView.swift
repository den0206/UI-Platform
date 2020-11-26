//
//  ExampleView.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/11/25.
//

import SwiftUI

struct ExampleView: View {
    
    @EnvironmentObject var model : CodeModel
    
    var body: some View {
        
        model.codeType.rootView
       
        
    }
}

struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}
