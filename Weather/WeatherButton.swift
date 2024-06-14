//
//  WeatherButton.swift
//  Weather
//
//  Created by Subham Dhakal on 6/9/24.
//

import Foundation
import SwiftUI

struct WeatherButton: View {
    var buttonText: String
    var textColor: Color
    var backgroundColor: Color
    var body: some View {
            Text(buttonText)
                .foregroundColor(textColor)
                .frame(width: 280,height: 50)
                .background(backgroundColor.gradient)
                .font(.system(size: 20,weight: .bold,design: .default))
                .cornerRadius(10)
        }
}
