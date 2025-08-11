//
//  CustomCircleView.swift
//  Hike
//
//  Created by Denis Yaremenko on 06.06.2025.
//

import SwiftUI

struct CustomCircleView: View {
    
    @State private var isAnimationGradient = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors:
                            [
                                Color.customIndigoMedium,
                                Color.colorSalmonLight
                            ],
                        startPoint: isAnimationGradient ? .topLeading : .bottomLeading,
                        endPoint: isAnimationGradient ? .bottomTrailing : .topTrailing
                    )
                )
                .onAppear {
                    withAnimation(.easeInOut(duration: 3.0).repeatForever(autoreverses: true)) {
                        isAnimationGradient.toggle()
                    }
                }
            
            MotionAnimationView()
            
        }
        .frame(width: 256, height: 256)
        .mask(Circle())
        .drawingGroup()
    }
}

#Preview {
    CustomCircleView()
}
