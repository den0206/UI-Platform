//
//  CodeListsView.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/11/28.
//

import SwiftUI

struct CodeListsView: View {
    
    var body: some View {
        
        VStack {
            
            Spacer().frame( height: 70)
            
            ScrollView {
                ForEach(CodeType.allCases) { type in
                    
                    TypeCell(type: type)
                }
            }
           
          
            Spacer()
            
        }
        .preferredColorScheme(.dark)
      
     
    }
}


struct TypeCell : View {
    
    @EnvironmentObject var model : CodeModel
    
    var type : CodeType

    
    var body: some View {
        
        
        Button(action: {model.setType(type: type)}) {
            
            VStack {
                HStack {
                    Text("\(type.title)")
                        .font(.headline)
                        .foregroundColor(.primary)
                        .padding(.leading,10)
                    
                    Spacer()
                    
                    if type == model.codeType {
                        
                        Image(systemName: "checkmark.circle")
                            .font(.system(size: 24))
                            .foregroundColor(.primary)
                            .padding(.trailing,10)
                    }
                    
                }
     
                Divider()
                    .background(Color.white)
             
            }
        }
    }
}

struct CodeListsView_Previews: PreviewProvider {
    static var previews: some View {
        CodeListsView()
    }
}
