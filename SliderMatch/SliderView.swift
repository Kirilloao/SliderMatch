//
//  SliderView.swift
//  SliderMatch
//
//  Created by Kirill Taraturin on 25.08.2023.
//

import SwiftUI

struct SliderView: View {
    @Binding var currentValue: Double
    
    let targetValue: Int
    let color: UIColor
    let alpha: Int
    
    var body: some View {
        VStack {
            Text("Подвинье слайдер, как можно ближе к: \(targetValue)")
            HStack {
                Text("0")
                CustomSlider(value: $currentValue, alpha: alpha, color: color)
                Text("100")
            }
            .padding()
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(
            currentValue: .constant(50),
            targetValue: 4,
            color: .red,
            alpha: 100
        )
    }
}
