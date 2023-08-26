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
    @ObservedObject var targetValueStore: TargetValueStore
    
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
        Coordinator(value: $value, alphaValue: $alphaValue, targetValueStore: _targetValueStore)
    }
}

extension CustomSlider {
    class Coordinator: NSObject {
        @Binding var value: Float
        @Binding var alphaValue: Double
        @ObservedObject var targetValueStore: TargetValueStore
        
        init(value: Binding<Float>, alphaValue: Binding<Double>, targetValueStore: ObservedObject<TargetValueStore>) {
            self._value = value
            self._alphaValue = alphaValue
            self._targetValueStore = targetValueStore
        }
        
        @objc func sliderDidChangeValue(_ sender: UISlider) {
            value = sender.value
            let difference = abs(targetValueStore.targetValue - Int(sender.value))
            let maxDifference = Float(sender.maximumValue)
            alphaValue = Double(max(1.0 - (Float(difference) / maxDifference), 0.0))
            
            
        }
    }
}

struct CustomSlider_Previews: PreviewProvider {
    static var previews: some View {
        let targetValueStore = TargetValueStore()
        CustomSlider(value: .constant(50.0), alphaValue: .constant(40), targetValueStore: targetValueStore)
            .environmentObject(targetValueStore)
    }
}

