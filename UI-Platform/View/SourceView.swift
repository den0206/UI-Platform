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
    @State private var loading = true
    
    var body: some View {
        
        VStack {
         
            CodeView(theme: CodeViewTheme.birdsOfParadise,
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
                
                

           
        }
        .loading(ishowing: $loading)
        
    
    }
}

struct SourceView_Previews: PreviewProvider {
    static var previews: some View {
        SourceView(codeType: .PlaneButton)
    }
}
