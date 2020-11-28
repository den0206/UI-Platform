//
//  SourceView.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/11/25.
//

import SwiftUI
import CodeMirror_SwiftUI

struct SourceView: View {
    
    @EnvironmentObject var model : CodeModel
    
    var codeType : CodeType
    @State private var loading = true
    
    @State private var selectedTheme = 0
    
    var themes = CodeViewTheme.allCases.sorted {
        return $0.rawValue < $1.rawValue
    }
    
    var body: some View {
        
        VStack {
            
            CodeView(theme: model.theme,
                     code: .constant(codeType.codeBlock),
                     mode: CodeMode.swift.mode(),
                     fontSize: 10,
                     showInvisibleCharacters : false,
                     lineWrapping: true)
                
                .onLoadSuccess {
                    /// indicator dismiss
                    self.loading = false
                }
                .onContentChange { newCode in
                    return
                }
                .onLoadFail { error in
                    print("Load failed : \(error.localizedDescription)")
                    self.loading = false

                }
                
            Spacer()
                

           
        }
        .loading(ishowing: $loading)
        .statusBar(hidden: true)
        .preferredColorScheme(.dark)
        
        
    
    }
}

struct SourceView_Previews: PreviewProvider {
    static var previews: some View {
        SourceView(codeType: .PlaneButton)
    }
}
