//
//  CustomButton.swift
//  SliderGuess
//
//  Created by Snow Lukin on 04.03.2022.
//

import SwiftUI

struct CustomButton: View {
    var text: String
    var strokeColor: Color
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background(Color.clear)
                .cornerRadius(20)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(strokeColor, lineWidth: 4)
        )
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(text: "Text", strokeColor: .orange, action: {})
    }
}
