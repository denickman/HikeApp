//
//  Constants.swift
//  Hike
//
//  Created by Denis Yaremenko on 06.06.2025.
//

import SwiftUI

enum Constants {
    
    // MARK: - Layout
    enum Layout {
        static let cardWidth: CGFloat = 320
        static let cardHeight: CGFloat = 570
        static let horizontalPadding: CGFloat = 30
        static let iconPreviewSize: CGFloat = 80
        static let iconPreviewCornerRadius: CGFloat = 16
        static let iconPreviewSpacing: CGFloat = 12
    }
    
    // MARK: - Typography
    enum Typography {
        static let titleFontSize: CGFloat = 52
        static let headerIconSize: CGFloat = 80
        static let headerTitleSize: CGFloat = 66
        static let headerSpacing: CGFloat = -10
        static let sectionSpacing: CGFloat = 8
        static let bottomPadding: CGFloat = 16
        static let topPadding: CGFloat = 8
    }
    
    // MARK: - Component Sizes
    enum Component {
        static let buttonSize: CGFloat = 50
        static let buttonIconSize: CGFloat = 30
        static let buttonBorderWidth: CGFloat = 4
        static let listRowIconSize: CGFloat = 30
        static let listRowCornerRadius: CGFloat = 10
        static let buttonHorizontalPadding: CGFloat = 30
        static let buttonCornerRadius: CGFloat = 40
    }
    
    // MARK: - Animation
    enum Animation {
        static let circleSize: CGFloat = 256
        static let circleCountRange: ClosedRange<Int> = 6...12
        static let gradientDuration: Double = 3.0
        static let imageTransitionDuration: Double = 0.25
        static let springStiffness: Double = 0.25
        static let springDamping: Double = 0.25
        static let circleOpacity: Double = 0.25
        static let coordinateRange: ClosedRange<CGFloat> = 0...256
        static let sizeRange: ClosedRange<Int> = 4...80
        static let scaleRange: ClosedRange<Double> = 0.1...2.0
        static let speedRange: ClosedRange<Double> = 0.25...1.0
        static let delayRange: ClosedRange<Double> = 0...2
    }
    
    // MARK: - Images
    enum Images {
        static let imageCount: Int = 5
        static let imageRange: ClosedRange<Int> = 1...5
    }
    
    // MARK: - Settings Screen
    enum Settings {
        static let iconPreviewTopPadding: CGFloat = 12
        static let iconPreviewBottomPadding: CGFloat = 12
        static let footerVerticalPadding: CGFloat = 8
        static let alternateAppIcons: [String] = [
            "AppIcon-MagnifyingGlass",
            "AppIcon-Map",
            "AppIcon-Mushroom",
            "AppIcon-Camera",
            "AppIcon-Backpack",
            "AppIcon-Campfire"
        ]
    }
    
    // MARK: - Background
    enum Background {
        static let cornerRadius: CGFloat = 40
        static let topOffset: CGFloat = 12
        static let middleOffset: CGFloat = 3
        static let middleOpacity: Double = 0.5
    }
    
    // MARK: - Shadow
    enum Shadow {
        static let opacity: Double = 0.25
        static let radius: CGFloat = 0.25
        static let x: CGFloat = 1
        static let y: CGFloat = 2
    }
    
    // MARK: - Spacing
    enum Spacing {
        static let iconPreviewSpacing: CGFloat = 12
        static let headerNegativeSpacing: CGFloat = -10
    }
    
    // MARK: - Strings
    enum Strings {
        enum CardView {
            static let title = "Hiking"
            static let subtitle = "Fun and enjoyable activities outdoor activity for friends and families"
            static let exploreButton = "Explore more"
        }
        
        enum SettingsScreen {
            static let appName = "Hike"
            static let editorChoice = "Editors` Choice"
            static let headerTitle = "Where can you find \nperfect tracks?"
            static let headerDescription = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In accumsan libero risus. Suspendisse vulputate lobortis augue at vehicula. Proin et aliquam nibh. Fusce vel consectetur purus. Nunc scelerisque mi ut sem tincidunt, in pharetra velit convallis."
            static let headerFooter = "Dust off the boots. It is time for a walk!"
            static let alternateIconsHeader = "Alternate Icons"
            static let alternateIconsDescription = "Choose your favourite app icon from the collection above"
            static let aboutHeader = "About the app"
            static let copyright = "Copyright © All right reserved."
            
            enum AppInfo {
                static let application = "Application"
                static let compatibility = "Compatibility"
                static let technology = "Technology"
                static let appVersion = "App version"
                static let developer = "Developer"
                static let designer = "Designer"
                static let website = "Website"
                
                static let applicationValue = "Hike"
                static let compatibilityValue = "iOS"
                static let technologyValue = "Swift"
                static let appVersionValue = "1.0"
                static let developerValue = "Alex Chacku"
                static let designerValue = "Nestor Ivan"
                static let websiteValue = "Credo Academy"
                static let websiteURL = "https://www.gmail.com"
            }
        }
        
        enum Errors {
            static let iconChangeFailed = "Failed request to update the app`s icon:"
            static let iconChangeSuccess = "Success changed app icon"
        }
    }
}

