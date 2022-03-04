//
//  ContentView.swift
//  SliderGuess
//
//  Created by Snow Lukin on 04.03.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue = Int.random(in: 1...100)
    @State private var currentValue = 50.0
    @State private var showAlert = false
        
    var body: some View {
        VStack {
            GameSlider(
                currentValue: $currentValue,
                targetValue: targetValue,
                color: .red,
                alpha: computeScore()
            )
            
            Button("Check") {
                showAlert = true
            }
            .padding()
            .alert("Your Score", isPresented: $showAlert, actions: {}) {
                Text("\(computeScore())")
            }
            
            Button("Change") {
                targetValue = Int.random(in: 1...100)
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
