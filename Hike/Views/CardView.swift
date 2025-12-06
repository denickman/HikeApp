//
//  CardView.swift
//  Hike
//
//  Created by Denis Yaremenko on 06.06.2025.
//

import SwiftUI

struct CardView: View {
    
    @StateObject private var viewModel = CardViewModel()
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        ZStack {
            CustomBackgroundView()
            VStack {
                HeaderView()
                MiddleContent()
                FooterView()
            }
        }
        .frame(width: Constants.Layout.cardWidth, height: Constants.Layout.cardHeight)
    }
    
    private func HeaderView() -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text(Constants.Strings.CardView.title)
                    .fontWeight(.black)
                    .font(.system(size: Constants.Typography.titleFontSize))
                    .foregroundStyle(
                        LinearGradient(
                            colors: Color.titleGradientColors(for: colorScheme),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                
                Spacer()
                
                Button {
                    viewModel.toggleSettingsSheet()
                } label: {
                    CustomButtonView()
                }
                .sheet(isPresented: $viewModel.isShowingSheet) {
                    SettingsScreen()
                        .presentationDragIndicator(.visible)
                        .presentationDetents([.medium, .large])
                }
            }
            Text(Constants.Strings.CardView.subtitle)
                .multilineTextAlignment(.leading)
                .italic()
                .foregroundColor(.customGrayMedium)
        }
        .padding(.horizontal, Constants.Layout.horizontalPadding)
    }

    
    private func MiddleContent() -> some View {
        ZStack {
            CustomCircleView()
            Image(viewModel.currentImageName)
                .resizable()
                .scaledToFit()
                .animation(.easeInOut(duration: Constants.Animation.imageTransitionDuration), value: viewModel.imageNumber)
        }
    }
    
    private func FooterView() -> some View {
        Button {
            viewModel.selectRandomImage()
        } label: {
            Text(Constants.Strings.CardView.exploreButton)
                .font(.title2)
                .fontWeight(.heavy)
                .foregroundStyle(
                    LinearGradient(
                        colors: Color.buttonGradientColors(for: colorScheme),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .shadow(
                    color: .black.opacity(Constants.Shadow.opacity),
                    radius: Constants.Shadow.radius,
                    x: Constants.Shadow.x,
                    y: Constants.Shadow.y
                )
        }
        .buttonStyle(GradientButtonStyle())
    }
}


#Preview {
    CardView()
}
