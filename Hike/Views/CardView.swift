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
        .frame(width: 320, height: 570)
    }
    
    private func randomImage() {
        repeat {
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber
        
        imageNumber = randomNumber
    }
    
    private func HeaderView() -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Hiking")
                    .fontWeight(.black)
                    .font(.system(size: 52))
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
            Text("Fun and enjoyable activities outdoor activity for friends and families")
                .multilineTextAlignment(.leading)
                .italic()
                .foregroundColor(.customGrayMedium)
        }
        .padding(.horizontal, 30)
    }

    
    private func MiddleContent() -> some View {
        ZStack {
            CustomCircleView()
            Image("image-\(imageNumber)")
                .resizable()
                .scaledToFit()
                .animation(.easeInOut(duration: 0.25), value: imageNumber)
        }
    }
    
    private func FooterView() -> some View {
        Button {
            randomImage()
        } label: {
            Text("Explore more")
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
                    color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2
                )
        }
        .buttonStyle(GradientButtonStyle())
    }
}


#Preview {
    CardView()
}
