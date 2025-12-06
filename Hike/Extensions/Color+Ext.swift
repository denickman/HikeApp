//
//  Color+Ext.swift
//  Hike
//
//  Created by Denis Yaremenko on 06.06.2025.
//

import Foundation
import SwiftUI

extension Color {
    static let customGreenLight = Color("ColorGreenLight")
    static let customGreenMedium = Color("ColorGreenMedium")
    static let customGreenDark = Color("ColorGreenDark")
    static let customGrayLight = Color("ColorGrayLight")
    static let customGrayMedium = Color("ColorGrayMedium")
    static let customIndigoMedium = Color("ColorIndigoMedium")
    static let customSalmonLight = Color("ColorSalmonLight")
    
    // MARK: - Adaptive Gradient Helpers
    
    /// Returns title gradient colors based on color scheme
    static func titleGradientColors(for colorScheme: ColorScheme?) -> [Color] {
        switch colorScheme {
        case .dark:
            return [.customGrayMedium, .customGrayLight]
        default:
            return [.customGrayLight, .customGrayMedium]
        }
    }
    
    /// Returns button gradient colors based on color scheme
    static func buttonGradientColors(for colorScheme: ColorScheme?) -> [Color] {
        switch colorScheme {
        case .dark:
            return [.customGreenMedium, .customGreenLight]
        default:
            return [.customGreenLight, .customGreenMedium]
        }
    }
    
    /// Returns header gradient colors based on color scheme
    static func headerGradientColors(for colorScheme: ColorScheme?) -> [Color] {
        switch colorScheme {
        case .dark:
            return [.customGreenDark, .customGreenMedium, .customGreenLight]
        default:
            return [.customGreenLight, .customGreenMedium, .customGreenDark]
        }
    }
    
    /// Returns background gradient colors based on color scheme
    static func backgroundGradientColors(for colorScheme: ColorScheme?) -> [Color] {
        switch colorScheme {
        case .dark:
            return [.customGreenDark, .customGreenMedium]
        default:
            return [.customGreenLight, .customGreenMedium]
        }
    }
    
    /// Returns circle gradient colors based on color scheme
    static func circleGradientColors(for colorScheme: ColorScheme?) -> [Color] {
        switch colorScheme {
        case .dark:
            return [.customIndigoMedium.opacity(0.8), .customSalmonLight.opacity(0.6)]
        default:
            return [.customIndigoMedium, .customSalmonLight]
        }
    }
    
    /// Returns button style gradient colors based on color scheme and pressed state
    static func buttonStyleGradientColors(for colorScheme: ColorScheme?, isPressed: Bool) -> [Color] {
        if isPressed {
            switch colorScheme {
            case .dark:
                return [.customGrayLight, .customGrayMedium]
            default:
                return [.customGrayMedium, .customGrayLight]
            }
        } else {
            switch colorScheme {
            case .dark:
                return [.customGrayMedium, .customGrayLight]
            default:
                return [.customGrayLight, .customGrayMedium]
            }
        }
    }
}
