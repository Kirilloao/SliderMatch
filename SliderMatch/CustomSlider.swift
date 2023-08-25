//
//  CustomSlider.swift
//  SliderMatch
//
//  Created by Kirill Taraturin on 25.08.2023.
//

import Foundation

import SwiftUI

struct CustomSlider: UIViewRepresentable {
    
    @Binding var value: Float
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.thumbTintColor = .systemRed
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderDidChangeValue),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = value
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

extension CustomSlider {
    class Coordinator: NSObject {
        @Binding var value: Float
        
        init(value: Binding<Float>) {
            self._value = value
        }
        
        @objc func sliderDidChangeValue(_ sender: UISlider) {
            value = sender.value
        }
    }
}

struct CustomSlider_Previews: PreviewProvider {
    static var previews: some View {
        CustomSlider(value: .constant(50.0))
    }
}

