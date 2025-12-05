//
//  MotionAnimationView.swift
//  Hike
//
//  Created by Denis Yaremenko on 06.06.2025.
//

import SwiftUI

struct MotionAnimationView: View {
    
    @State private var randomCircle = Int.random(in: Constants.Animation.circleCountRange)
    @State private var isAnimating = false
    
    var animation: Animation = {
        .interpolatingSpring(
            stiffness: Constants.Animation.springStiffness,
            damping: Constants.Animation.springDamping
        )
        .repeatForever(autoreverses: true)
    }()
    
    var body: some View {
        ZStack {
            ForEach(0...randomCircle, id: \.self) { item in
                Circle()
                    .foregroundColor(.white)
                    .opacity(Constants.Animation.circleOpacity)
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
                                stiffness: Constants.Animation.springStiffness,
                                damping: Constants.Animation.springDamping
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
        .frame(width: Constants.Animation.circleSize, height: Constants.Animation.circleSize)
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
        return CGFloat.random(in: Constants.Animation.coordinateRange)
    }
    
    
    // 2. random size
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: Constants.Animation.sizeRange))
    }
    
    
    // 3. random scale
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: Constants.Animation.scaleRange))
    }
    
    
    // 4. random speed
    func randomSpeed() -> Double {
        return Double.random(in: Constants.Animation.speedRange)
    }
    
    
    // 5. random delay
    func randomDelay() -> Double {
        return Double.random(in: Constants.Animation.delayRange)
    }
    
    
}

