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
        CodeView(theme: CodeViewTheme.birdsOfParadise,
                 code: .constant(codeType.codeBlock),
                 mode: CodeMode.swift.mode(),
                 fontSize: 12,
                 showInvisibleCharacters : false,
                 lineWrapping: true)
            
            .onLoadSuccess {
                
            }
            .onContentChange { newCode in
                print("Content Change")
            }
            .onLoadFail { error in
                print("Load failed : \(error.localizedDescription)")
            }
            .disabled(true)
    }
}

struct SourceView_Previews: PreviewProvider {
    static var previews: some View {
        SourceView(codeType: .Button)
    }
}
