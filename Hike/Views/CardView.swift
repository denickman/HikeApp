//
//  CardView.swift
//  Hike
//
//  Created by Denis Yaremenko on 06.06.2025.
//

import SwiftUI

struct CardView: View {
    
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet = false
    
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
    
    private func randomImage() {
        repeat {
            randomNumber = Int.random(in: Constants.Images.imageRange)
        } while randomNumber == imageNumber
        
        imageNumber = randomNumber
    }
    
    private func HeaderView() -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text(Constants.Strings.CardView.title)
                    .fontWeight(.black)
                    .font(.system(size: Constants.Typography.titleFontSize))
                    .foregroundStyle(
                        LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom)
                    )
                
                Spacer()
                
                Button {
                    // show a sheet
                    isShowingSheet.toggle()
                } label: {
                    CustomButtonView()
                }
                .sheet(isPresented: $isShowingSheet) {
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
            Image("image-\(imageNumber)")
                .resizable()
                .scaledToFit()
                .animation(.easeInOut(duration: Constants.Animation.imageTransitionDuration), value: imageNumber)
        }
    }
    
    private func FooterView() -> some View {
        Button {
            randomImage()
        } label: {
            Text(Constants.Strings.CardView.exploreButton)
                .font(.title2)
                .fontWeight(.heavy)
                .foregroundStyle(
                    LinearGradient(
                        colors: [.customGreenLight, .customGreenMedium],
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
