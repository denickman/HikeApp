//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Denis Yaremenko on 06.06.2025.
//

import Foundation
import SwiftUI

struct GradientButtonStyle: ButtonStyle {
    
    @Environment(\.colorScheme) private var colorScheme
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, Constants.Component.buttonHorizontalPadding)
            .background(
                LinearGradient(
                    colors: Color.buttonStyleGradientColors(for: colorScheme, isPressed: configuration.isPressed),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .cornerRadius(Constants.Component.buttonCornerRadius)
    }
}
