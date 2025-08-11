//
//  MotionAnimationView.swift
//  Hike
//
//  Created by Denis Yaremenko on 06.06.2025.
//

import SwiftUI

struct MotionAnimationView: View {
    
    @State private var randomCircle = Int.random(in: 6...12)
    @State private var isAnimating = false
    
    var animation: Animation = {
        .interpolatingSpring(
            stiffness: 0.25, damping: 0.25
        )
        .repeatForever(autoreverses: true)
    }()
    
    var body: some View {
        ZStack {
            ForEach(0...randomCircle, id: \.self) { item in
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.25)
                    .frame(width: randomSize())
                    .position(
                        x: randomCoordinate(),
                        y: randomCoordinate()
                    )
                    .scaleEffect(isAnimating ? randomScale() :  1)
//                    .animation(
//                        animation
//                        .speed(randomSpeed())
//                        .delay(randomDelay()),
//                               value: isAnimating
//                    )
                    .onAppear {
                        withAnimation(
                            .interpolatingSpring(
                                stiffness: 0.25, damping: 0.25
                            )
                            .repeatForever(autoreverses: true)
                            .speed(randomSpeed())
                            .delay(randomDelay())
                        ) {
                            isAnimating.toggle()
                        }
                    }
            }
        }
        .frame(width: 256, height: 256)
        .mask(Circle())
    }
}

#Preview {
    MotionAnimationView()
        .background(
            Circle()
                .fill(.teal)
        )
}

extension MotionAnimationView {
    
    
    // MARK: - Methods
    // 1. random coordinate
    func randomCoordinate() -> CGFloat {
        return CGFloat.random(in: 0...256)
    }
    
    
    // 2. random size
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 4...80))
    }
    
    
    // 3. random scale
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    
    // 4. random speed
    func randomSpeed() -> Double {
        return Double.random(in: 0.25...1.0)
    }
    
    
    // 5. random delay
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    
}

