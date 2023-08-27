//
//  ContentView.swift
//  SliderMatch
//
//  Created by Kirill Taraturin on 25.08.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue = Double.random(in: 0...100)
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            SliderView(
                currentValue: $currentValue,
                targetValue: targetValue,
                color: .red,
                alpha: computeScore()
            )
            Button("Проверь меня!") {
                showAlert.toggle()
            }
            .padding()
            .alert("Your Score", isPresented: $showAlert, actions: {}) {
                Text(computeScore().formatted())
            }
            
            Button("Начать заново") {
                targetValue = Int.random(in: 1...100)
                currentValue = Double.random(in: 0...100)
            }
        }
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
