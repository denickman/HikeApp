//
//  CustomButtonView.swift
//  Hike
//
//  Created by Denis Yaremenko on 06.06.2025.
//

import SwiftUI

struct CustomButtonView: View {
    
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(colors: [.white, .customGreenLight, .customGreenMedium], startPoint: .top, endPoint: .bottom)
                )
            
            Circle()
                .stroke(
                    LinearGradient(
                        colors: [.customGrayLight, .customGrayMedium],
                        startPoint: .top,
                        endPoint: .bottom),
                    lineWidth: Constants.Component.buttonBorderWidth
                )
            
            Image(systemName: "figure.hiking")
                .fontWeight(.black)
                .font(.system(size: Constants.Component.buttonIconSize))
                .foregroundStyle(
                    LinearGradient(
                        colors: [.customGrayLight, .customGrayMedium],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
        }
        .frame(width: Constants.Component.buttonSize, height: Constants.Component.buttonSize)
    }
}

#Preview {
    CustomButtonView()
}
