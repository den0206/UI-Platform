//
//  HomeView.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/11/24.
//

import SwiftUI
import CodeMirror_SwiftUI

struct SampleView: View {
    
    @State private var codeBlock = try! String(contentsOf: Bundle.main.url(forResource: "Demo", withExtension: "txt")!)
    @State private var selectedTheme = 0
    

    
    private var themes = CodeViewTheme.allCases.sorted {
        return $0.rawValue < $1.rawValue
    }
    
    
    var body: some View {
        
        VStack {
            HStack {
                Picker(selection: $selectedTheme, label: Text("CodeView Theme")) {
                    ForEach(0 ..< themes.count) {
                        Text(self.themes[$0].rawValue)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .frame(minWidth: 100, idealWidth: 150, maxWidth: 150)
            }
            
            Spacer()
            
            CodeView(theme: CodeViewTheme.birdsOfParadise,
                     code: $codeBlock,
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
            
        }
        
        
    }
}


struct SampleView_Previews: PreviewProvider {
    static var previews: some View {
        SampleView()
    }
}
