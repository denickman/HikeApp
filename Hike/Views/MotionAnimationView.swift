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
    
    // Cache random values to avoid regenerating on every view update
    @State private var circleData: [CircleData] = []
    
    var body: some View {
        ZStack {
            ForEach(circleData.indices, id: \.self) { index in
                let data = circleData[index]
                Circle()
                    .foregroundColor(.white)
                    .opacity(Constants.Animation.circleOpacity)
                    .frame(width: data.size)
                    .position(x: data.x, y: data.y)
                    .scaleEffect(isAnimating ? data.scale : 1)
                    .onAppear {
                        withAnimation(
                            .interpolatingSpring(
                                stiffness: Constants.Animation.springStiffness,
                                damping: Constants.Animation.springDamping
                            )
                            .repeatForever(autoreverses: true)
                            .speed(data.speed)
                            .delay(data.delay)
                        ) {
                            isAnimating.toggle()
                        }
                    }
            }
        }
        .frame(width: Constants.Animation.circleSize, height: Constants.Animation.circleSize)
        .mask(Circle())
        .onAppear {
            generateCircleData()
        }
    }
    
    private func generateCircleData() {
        circleData = (0...randomCircle).map { _ in
            CircleData(
                size: CGFloat(Int.random(in: Constants.Animation.sizeRange)),
                x: CGFloat.random(in: Constants.Animation.coordinateRange),
                y: CGFloat.random(in: Constants.Animation.coordinateRange),
                scale: CGFloat(Double.random(in: Constants.Animation.scaleRange)),
                speed: Double.random(in: Constants.Animation.speedRange),
                delay: Double.random(in: Constants.Animation.delayRange)
            )
        }
    }
}

// MARK: - CircleData Model
private struct CircleData {
    let size: CGFloat
    let x: CGFloat
    let y: CGFloat
    let scale: CGFloat
    let speed: Double
    let delay: Double
}

#Preview {
    MotionAnimationView()
        .background(
            Circle()
                .fill(.teal)
        )
}


