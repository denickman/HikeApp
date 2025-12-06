//
//  HikeApp.swift
//  Hike
//
//  Created by Denis Yaremenko on 06.06.2025.
//

import SwiftUI

@main
struct HikeApp: App {
    @ObservedObject private var appearanceManager = AppearanceManager.shared
    
    var body: some Scene {
        WindowGroup {
            CardView()
                .preferredColorScheme(appearanceManager.colorScheme)
                .environmentObject(appearanceManager)
        }
    }
}
