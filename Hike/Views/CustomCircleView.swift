//
//  CustomCircleView.swift
//  Hike
//
//  Created by Denis Yaremenko on 06.06.2025.
//

import SwiftUI

struct CustomCircleView: View {
    
    @State private var isAnimationGradient = false
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors: Color.circleGradientColors(for: colorScheme),
                        startPoint: isAnimationGradient ? .topLeading : .bottomLeading,
                        endPoint: isAnimationGradient ? .bottomTrailing : .topTrailing
                    )
                )
                .onAppear {
                    withAnimation(.easeInOut(duration: Constants.Animation.gradientDuration).repeatForever(autoreverses: true)) {
                        isAnimationGradient.toggle()
                    }
                }
            
            MotionAnimationView()
            
        }
        .frame(width: Constants.Animation.circleSize, height: Constants.Animation.circleSize)
        .mask(Circle())
        .drawingGroup()
    }
}

#Preview {
    CustomCircleView()
}
