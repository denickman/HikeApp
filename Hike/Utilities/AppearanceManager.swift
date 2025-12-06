//
//  AppearanceManager.swift
//  Hike
//
//  Created by Denis Yaremenko on 06.06.2025.
//

import Foundation
import SwiftUI

/// Manages app appearance theme (Light, Dark, System)
@MainActor
class AppearanceManager: ObservableObject {
    
    // MARK: - Singleton
    static let shared = AppearanceManager()
    
    // MARK: - Published Properties
    @Published var colorScheme: ColorScheme?
    
    // MARK: - Private Properties
    private let userDefaultsKey = "appearanceTheme"
    
    // MARK: - Initialization
    private init() {
        loadTheme()
    }
    
    // MARK: - Public Properties
    
    /// Current theme preference
    var currentTheme: AppearanceTheme {
        get {
            if let rawValue = UserDefaults.standard.string(forKey: userDefaultsKey),
               let theme = AppearanceTheme(rawValue: rawValue) {
                return theme
            }
            return .system
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: userDefaultsKey)
            applyTheme(newValue)
        }
    }
    
    // MARK: - Public Methods
    
    /// Applies the specified theme
    /// - Parameter theme: The theme to apply
    func applyTheme(_ theme: AppearanceTheme) {
        switch theme {
        case .light:
            colorScheme = .light
        case .dark:
            colorScheme = .dark
        case .system:
            colorScheme = nil // nil means use system default
        }
    }
    
    /// Loads theme from UserDefaults and applies it
    func loadTheme() {
        applyTheme(currentTheme)
    }
    
    /// Toggles between light and dark themes (skips system)
    func toggleTheme() {
        switch currentTheme {
        case .light:
            currentTheme = .dark
        case .dark:
            currentTheme = .light
        case .system:
            // If system, default to dark when toggling
            currentTheme = .dark
        }
    }
}

// MARK: - AppearanceTheme Enum
enum AppearanceTheme: String, CaseIterable {
    case light = "light"
    case dark = "dark"
    case system = "system"
    
    var displayName: String {
        switch self {
        case .light:
            return "Light"
        case .dark:
            return "Dark"
        case .system:
            return "System"
        }
    }
    
    var iconName: String {
        switch self {
        case .light:
            return "sun.max.fill"
        case .dark:
            return "moon.fill"
        case .system:
            return "circle.lefthalf.filled"
        }
    }
}

