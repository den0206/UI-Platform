//
//  SwipeHeaderView.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2021/02/12.
//

import SwiftUI

struct SwipeHeaderView : View {

    @StateObject var vm = SwipeHeaderViewModel()
    let edges = UIApplication.shared.windows.first?.safeAreaInsets
    let width = UIScreen.main.bounds.width


//    init() {
//        UIScrollView.appearance().bounces = false
//    }
    
    var body: some View {
        
        ZStack(alignment: .top) {
            /// header
            SwipeHeader()
                .zIndex(1)
                .offset(y: vm.headerOffset)
            
            ScrollView {
                
                VStack(spacing :15) {
                    
                    ForEach(1...5, id : \.self) { i in
                        
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.black)
                            .frame(width: width - 30, height: 250)
                      
                    }
                    
                }
                .padding(.top,75)
                .overlay(
                    GeometryReader { proxy -> Color in
                        
                        let minY = proxy.frame(in: .global).minY
                        
                        DispatchQueue.main.async {
                            
                            if vm.startMinY == 0 {
                                vm.startMinY = minY
                            }
                            
                            let offset = vm.startMinY - minY
                            
                            if offset > vm.offset {
                                /// scroll Top
                                
                                vm.bottomScrollOffset = 0
                                
                                if vm.topScrollOffset == 0 {
                                    vm.topScrollOffset = offset
                                }
                                
                                let progress = (vm.topScrollOffset + getMaxOffset()) - offset
                                
                                let offsetCondition = (vm.topScrollOffset + getMaxOffset()) >= getMaxOffset() && getMaxOffset() - progress <= getMaxOffset()
                                
                                let headerOffset = offsetCondition ? -(getMaxOffset() - progress) : -getMaxOffset()
                                
                                vm.headerOffset = headerOffset
                                
                            }
                            
                            if offset < vm.offset {
                                /// scroll bottom
                                
                                vm.topScrollOffset = 0
                                
                                if  vm.bottomScrollOffset == 0 {
                                    vm.bottomScrollOffset = offset
                                }
                                
                                withAnimation(.easeOut(duration: 0.25)) {
                                    let headerOffset = vm.headerOffset
                                    
                                    vm.headerOffset = vm.bottomScrollOffset >= offset + 40 ? 0 : (headerOffset != -getMaxOffset() ? 0 : headerOffset)
                                }
                            }
                            
                            vm.offset = offset
                        }
                        
                        return Color.clear
                    }
                    .frame(height:0),alignment:.top
                )
                
            }
            
        }
    }
    
    func getMaxOffset() -> CGFloat {
       
        return vm.startMinY + (edges?.top ?? 0) + 10
    }
}


struct SwipeHeader : View {
    
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        
        HStack(spacing :30) {
            Image(systemName: "uoutube")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("Youtube ")
                .font(.title3)
                .foregroundColor(.primary)
                .kerning(0.5)
                .offset(x: -10)
            
            Spacer()
            
            Button(action: {}) {
                Image(systemName: "display")
                    .font(.title2)
                    .foregroundColor(.primary)
            }
            
            Button(action: {}) {
                Image(systemName: "bell")
                    .font(.title2)
                    .foregroundColor(.primary)
            }
            
            
            Button(action: {}) {
                Image(systemName: "magnifyingglass")
                    .font(.title2)
                    .foregroundColor(.primary)
            }
            
            
        }
        .padding(.horizontal)
        .padding(.vertical,8)
        .background((scheme == .dark ? Color.black : Color.white).ignoresSafeArea(.all, edges: .top))
        .overlay(Divider(),alignment:.bottom)
    }
}

class SwipeHeaderViewModel : ObservableObject {
    
    @Published var startMinY : CGFloat = 0
    
    @Published var offset : CGFloat = 0
    
    @Published var headerOffset : CGFloat = 0
    
    @Published var topScrollOffset : CGFloat = 0
    @Published var bottomScrollOffset : CGFloat = 0
}
