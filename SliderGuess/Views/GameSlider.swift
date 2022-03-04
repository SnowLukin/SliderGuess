//
//  ContentView.swift
//  SliderGuess
//
//  Created by Snow Lukin on 04.03.2022.
//

import SwiftUI

struct GameSlider: View {
    @Binding var currentValue: Double
    
    let targetValue: Int
    let color: UIColor
    let alpha: Int
    
    var body: some View {
        VStack {
            Text("Goal: \(targetValue)")
                .font(.largeTitle)
                .fontWeight(.semibold)
            HStack {
                Text("0")
                    .font(.title3)
                    .fontWeight(.semibold)
                CustomSlider(value: $currentValue, alpha: alpha, color: color)
                Text("100")
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            .padding()
        }
    }
}

struct GameSlider_Previews: PreviewProvider {
    static var previews: some View {
        GameSlider(
            currentValue: .constant(50),
            targetValue: 100,
            color: .red,
            alpha: 100
        )
    }
}
