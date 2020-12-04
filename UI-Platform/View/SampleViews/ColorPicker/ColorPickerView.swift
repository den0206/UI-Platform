//
//  ColorPickerView.swift
//  UI-Platform
//
//  Created by 酒井ゆうき on 2020/12/03.
//

import SwiftUI

struct ColorPickerView: View {
    
    @State private var colors = UIColor.green
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.init(colors))
                .edgesIgnoringSafeArea(.all)
            
            ColorPicker(colors: $colors)
//                .preferredColorScheme(.light)
                
        }
      
    }
}

struct ColorPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerView()
    }
}

struct ColorPicker : UIViewControllerRepresentable {
    
    @Binding var colors : UIColor
    
    func makeCoordinator() -> Coordinator {
        Coordinator(color1: self)
    }
    
    func makeUIViewController(context: Context) -> UIColorPickerViewController {
        let picker = UIColorPickerViewController()
        picker.delegate = context.coordinator
        picker.selectedColor = colors
        
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIColorPickerViewController, context: UIViewControllerRepresentableContext<ColorPicker>) {
        uiViewController.selectedColor.resolvedColor(with: UITraitCollection.current)
    }
    
    class Coordinator : NSObject, UINavigationControllerDelegate, UIColorPickerViewControllerDelegate {
        
        var color : ColorPicker
        
        init(color1 : ColorPicker) {
            color = color1
        }
        
        func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
            self.color.colors = viewController.selectedColor
        }
    }
}
