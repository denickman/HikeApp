//
//  CustomBackgroundView.swift
//  Hike
//
//  Created by Denis Yaremenko on 06.06.2025.
//

import SwiftUI

struct CustomBackgroundView: View {
    
    
    var body: some View {
        ZStack {
            Color.colorGreenDark
                .clipShape(RoundedRectangle(cornerRadius: Constants.Background.cornerRadius))
                .offset(y: Constants.Background.topOffset)
            
            Color.colorGreenLight
                .clipShape(RoundedRectangle(cornerRadius: Constants.Background.cornerRadius))
                .offset(y: Constants.Background.middleOffset)
                .opacity(Constants.Background.middleOpacity)
            
            LinearGradient(
                colors: [Color.colorGreenLight, Color.colorGreenMedium],
                startPoint: .top,
                endPoint: .bottom
            )
            .clipShape(RoundedRectangle(cornerRadius: Constants.Background.cornerRadius))
        }
    }
}

#Preview {
    CustomBackgroundView()
        .padding()
}
