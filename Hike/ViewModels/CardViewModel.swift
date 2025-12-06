//
//  CardViewModel.swift
//  Hike
//
//  Created by Denis Yaremenko on 06.06.2025.
//

import Foundation
import SwiftUI

@MainActor
class CardViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var imageNumber: Int = Constants.Images.imageRange.lowerBound
    @Published var isShowingSheet: Bool = false
    
    // MARK: - Private Properties
    private var randomNumber: Int = Constants.Images.imageRange.lowerBound
    
    // MARK: - Public Methods
    
    /// Selects a random image that's different from the current one
    func selectRandomImage() {
        repeat {
            randomNumber = Int.random(in: Constants.Images.imageRange)
        } while randomNumber == imageNumber
        
        imageNumber = randomNumber
    }
    
    /// Toggles the settings sheet presentation
    func toggleSettingsSheet() {
        isShowingSheet.toggle()
    }
    
    /// Gets the current image name
    var currentImageName: String {
        "image-\(imageNumber)"
    }
}


