//
//  SettingsViewModel.swift
//  Hike
//
//  Created by Denis Yaremenko on 06.06.2025.
//

import Foundation
import SwiftUI
import UIKit

@MainActor
class SettingsViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var errorMessage: String?
    @Published var showError: Bool = false
    
    // MARK: - Public Properties
    let alternateAppIcons: [String] = Constants.Settings.alternateAppIcons
    
    // MARK: - Public Methods
    
    /// Changes the app icon to the specified icon name
    /// - Parameter iconName: The name of the alternate app icon to set
    func changeAppIcon(to iconName: String) {
        UIApplication.shared.setAlternateIconName(iconName) { [weak self] error in
            Task { @MainActor in
                if let error = error {
                    let errorDescription = error.localizedDescription
                    self?.errorMessage = "\(Constants.Strings.Errors.iconChangeFailed) \(errorDescription)"
                    self?.showError = true
                    print("\(Constants.Strings.Errors.iconChangeFailed) \(errorDescription)")
                } else {
                    print(Constants.Strings.Errors.iconChangeSuccess)
                    // Optionally show success message
                }
            }
        }
    }
    
    /// Dismisses the error alert
    func dismissError() {
        errorMessage = nil
        showError = false
    }
}


