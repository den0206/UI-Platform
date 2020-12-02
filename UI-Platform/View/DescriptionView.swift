//
//  DescriptionView.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/12/02.
//

import SwiftUI

struct DescriptionView: View {
    
    @EnvironmentObject var model : CodeModel
    @Environment(\.presentationMode) var presentationMode

    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading) {
                
                HStack {
                    Spacer()
                    
                    Button(action: {presentationMode.wrappedValue.dismiss()}, label: {
                        Image(systemName: "xmark.circle")
                            .font(.system(size: 32))
                            .foregroundColor(.primary)
                    })
                }
                .padding(.top,8)
                
                
                Group {
                    
                    Text("Relation Url")
                        .fontWeight(.bold)
                        .font(.system(size: 32))
                        .underline()
                        .padding(.bottom,8)
                    
                    NavigationLink(destination: WebSampleView()) {
                        
                        
                        Text(model.codeType.relationUrlString)
                            .lineLimit(1)
                            .padding()
                            .background(Color(.systemGray3))
                            .cornerRadius(12)
                            .padding(.horizontal)
                            .foregroundColor(.gray)
                        
                        
                    }
                    
                }
               
                Divider()
                    .background(Color.gray)
                    .padding(.vertical,8)
                
                Group {
                    
                    Text("Description")
                        .fontWeight(.bold)
                        .font(.system(size: 32))
                        .underline()
                        .padding(.bottom,8)
                    
                    
                    Text(model.codeType.description)
                        .padding()
                        .background(Color(.systemGray3))
                        .cornerRadius(12)
                        .padding(.horizontal)
                        .foregroundColor(.gray)
                    
                    
                    
                }
                
                Spacer()
                
                
                
                
            }
          
            .navigationBarHidden(true)
        }
        .preferredColorScheme(.dark)
       
       
    }

}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView()
    }
}
