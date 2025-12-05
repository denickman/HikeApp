//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Denis Yaremenko on 06.06.2025.
//

import Foundation
import SwiftUI

struct GradientButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, Constants.Component.buttonHorizontalPadding)
            .background(
                configuration.isPressed ?
                LinearGradient(
                    colors: [.customGrayMedium, .customGrayLight],
                    startPoint: .top,
                    endPoint: .bottom
                )
                : LinearGradient(
                    colors: [.customGrayLight, .customGrayMedium],
                    startPoint:  .top,
                    endPoint: .bottom
                )
            )
            .cornerRadius(Constants.Component.buttonCornerRadius)
    }
}
