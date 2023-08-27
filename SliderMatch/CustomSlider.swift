//
//  CustomSlider.swift
//  SliderMatch
//
//  Created by Kirill Taraturin on 25.08.2023.
//

import Foundation

import SwiftUI

struct CustomSlider: UIViewRepresentable {
    
    @Binding var value: Double
    
    var alpha: Int
    var color: UIColor
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.value = Float(value)
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ view: UISlider, context: Context) {
        view.value = Float(value)
        view.thumbTintColor = color.withAlphaComponent(CGFloat(alpha) / 100)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

extension CustomSlider {
    class Coordinator: NSObject {
        
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct CustomSlider_Previews: PreviewProvider {
    static var previews: some View {
        CustomSlider(value: .constant(50), alpha: 100, color: .blue)
    }
}

