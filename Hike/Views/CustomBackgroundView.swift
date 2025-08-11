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
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .offset(y: 12)
            
            Color.colorGreenLight
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .offset(y: 3)
                .opacity(0.5)
            
            LinearGradient(
                colors: [Color.colorGreenLight, Color.colorGreenMedium],
                startPoint: .top,
                endPoint: .bottom
            )
            .clipShape(RoundedRectangle(cornerRadius: 40))
        }
    }
}

#Preview {
    CustomBackgroundView()
        .padding()
}
