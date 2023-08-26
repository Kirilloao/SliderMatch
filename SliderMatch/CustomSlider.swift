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
    @Binding var alphaValue: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.thumbTintColor = .systemRed.withAlphaComponent(alphaValue)
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderDidChangeValue),
            for: .valueChanged
        )
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = value
        uiView.thumbTintColor = .systemRed.withAlphaComponent(alphaValue)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value, alphaValue: $alphaValue)
    }
}

extension CustomSlider {
    class Coordinator: NSObject {
        @Binding var value: Float
        @Binding var alphaValue: Double
        
        init(value: Binding<Float>, alphaValue: Binding<Double>) {
            self._value = value
            self._alphaValue = alphaValue
        }
        
        @objc func sliderDidChangeValue(_ sender: UISlider) {
            value = sender.value
 
                    
        }
    }
}

struct CustomSlider_Previews: PreviewProvider {
    static var previews: some View {
        CustomSlider(value: .constant(50.0), alphaValue: .constant(40))
    }
}

