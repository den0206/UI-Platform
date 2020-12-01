//
//  WebSampleView.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/12/01.
//

import SwiftUI
import WebKit

struct WebSampleView: View {
    
    @EnvironmentObject var model : CodeModel
    @Environment(\.presentationMode) var presentationMode

    
    var body: some View {
        NavigationView {
            
            MyWebView(urlString: model.codeType.relationUrlString)
            
                .navigationBarTitle(model.codeType.relationUrlString, displayMode: .inline)
                .navigationBarItems(leading:
                                        Button(action: {presentationMode.wrappedValue.dismiss()}, label: {
                                            Image(systemName: "xmark")
                                                .foregroundColor(.primary)
                                        })
                )

        }
    }
}

struct MyWebView : UIViewRepresentable {
    
    let urlString : String
    
    func makeUIView(context: Context) -> WKWebView {
        
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
        guard let url = URL(string: urlString) else {return}
        
        uiView.load(URLRequest(url: url))
    }
}

struct WebSampleView_Previews: PreviewProvider {
    static var previews: some View {
        WebSampleView()
    }
}
