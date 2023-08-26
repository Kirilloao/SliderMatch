//
//  ContentView.swift
//  SliderMatch
//
//  Created by Kirill Taraturin on 25.08.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue = Int.random(in: 1...100)
    @State private var currentValue = Float.random(in: 1...100)
    @State private var showAlert = false
    @State private var alphaValue = 1.0
    @EnvironmentObject private var targetValueStore: TargetValueStore
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
            SliderView(value: $currentValue,
                       alphaValue: $alphaValue
            )
            VStack {
                Button("Проверь меня!") {
                    showAlert = true
                }
                .padding()
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Результат"),
                        message: Text("Вы набрали \(computeScore()) очков")
                    )
                }
                Button("Начать заново") {
                    targetValueStore.targetValue = Int.random(in: 1...100)
                    targetValue = targetValueStore.targetValue
                    
                }
            }
        }
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValueStore.targetValue - lround(Double(currentValue)))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TargetValueStore())
    }
}
