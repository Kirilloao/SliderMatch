//
//  SliderView.swift
//  SliderMatch
//
//  Created by Kirill Taraturin on 25.08.2023.
//

import SwiftUI

struct SliderView: View {
    
    @Binding var value: Float
    
    var body: some View {
        HStack {
            Text("0")
            CustomSlider(value: $value)
            Text("100")
        }
        .padding()
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(value: .constant(50.0))
    }
}
