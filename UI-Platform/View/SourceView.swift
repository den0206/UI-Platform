//
//  SourceView.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/11/25.
//

import SwiftUI
import CodeMirror_SwiftUI

struct SourceView: View {
    
    var codeType : CodeType
    
    var body: some View {
        
        VStack {
         
            CodeView(theme: CodeViewTheme.birdsOfParadise,
                     code: .constant(codeType.codeBlock),
                     mode: CodeMode.swift.mode(),
                     fontSize: 12,
                     showInvisibleCharacters : false,
                     lineWrapping: true)
                
                .onLoadSuccess {
                    /// indicator dismiss
                }
                .onContentChange { newCode in
                    print("Content Change")
                }
                .onLoadFail { error in
                    print("Load failed : \(error.localizedDescription)")
                }
           
        }
        .onAppear {
            /// indicator
        }
        
    
    }
}

struct SourceView_Previews: PreviewProvider {
    static var previews: some View {
        SourceView(codeType: .PlaneButton)
    }
}
