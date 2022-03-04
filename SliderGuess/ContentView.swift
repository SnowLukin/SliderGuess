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
        ZStack {
            Color("lightOrange")
                .ignoresSafeArea()
            VStack {
                Spacer()
                Spacer()
                Spacer()
                GameSlider(
                    currentValue: $currentValue,
                    targetValue: targetValue,
                    color: .red,
                    alpha: computeScore()
                )
                Spacer()
                Spacer()
                buttonsStack
                    .padding()
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    
    private var buttonsStack: some View {
        VStack(spacing: 30) {
            CustomButton(
                text: "Check",
                strokeColor: .orange,
                action: {
                    showAlert = true
                }
            )
            .alert("Your Score", isPresented: $showAlert, actions: {}) {
                Text("\(computeScore())")
            }
            
            CustomButton(
                text: "Change",
                strokeColor: .orange,
                action: {
                    targetValue = Int.random(in: 1...100)
                }
            )
        }
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}
