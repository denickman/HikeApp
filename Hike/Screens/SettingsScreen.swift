//
//  SettingsScreen.swift
//  Hike
//
//  Created by Denis Yaremenko on 06.06.2025.
//

import SwiftUI

struct SettingsScreen: View {
    
    private let alternateAppIcons: [String] = Constants.Settings.alternateAppIcons
    
    var body: some View {
        List {
            HeaderView()
            MiddleContentView()
            FooterView()
        }
    }
    
    func HeaderView() -> some View {
        Section {
            HStack {
                Spacer()
                
                Image(systemName: "laurel.leading")
                    .font(.system(size: Constants.Typography.headerIconSize, weight: .black))
                
                VStack(spacing: Constants.Typography.headerSpacing) {
                    Text(Constants.Strings.SettingsScreen.appName)
                        .font(.system(size: Constants.Typography.headerTitleSize, weight: .black))
                    Text(Constants.Strings.SettingsScreen.editorChoice)
                        .fontWeight(.medium)
                }
                
                Image(systemName: "laurel.trailing")
                    .font(.system(size: Constants.Typography.headerIconSize, weight: .black))
                
                Spacer()
            }
            .foregroundStyle(
                LinearGradient(
                    colors: [.customGreenLight, .customGreenMedium, .customGreenDark],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .padding(.top, Constants.Typography.topPadding)
            
            VStack(spacing: Constants.Typography.sectionSpacing) {
                Text(Constants.Strings.SettingsScreen.headerTitle)
                    .font(.title2)
                    .fontWeight(.heavy)
                
                Text(Constants.Strings.SettingsScreen.headerDescription)
                    .font(.footnote)
                    .italic()
                
                Text(Constants.Strings.SettingsScreen.headerFooter)
                    .fontWeight(.heavy)
                    .foregroundColor(.customGreenMedium)
            }
            .multilineTextAlignment(.center)
            .padding(.bottom, Constants.Typography.bottomPadding)
            .frame(maxWidth: .infinity)
        }
        .listRowSeparator(.hidden)
    }
    
    private func MiddleContentView() -> some View {
        Section(header: Text(Constants.Strings.SettingsScreen.alternateIconsHeader)) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: Constants.Spacing.iconPreviewSpacing) {
                    ForEach(alternateAppIcons.indices, id: \.self) { item in
                        Button {
                            UIApplication.shared.setAlternateIconName(alternateAppIcons[item]) { error in
                                if error != nil {
                                    print("\(Constants.Strings.Errors.iconChangeFailed) \(String(describing: error?.localizedDescription))")
                                } else {
                                    print(Constants.Strings.Errors.iconChangeSuccess)
                                }
                                
                            }
                        } label: {
                            Image("\(alternateAppIcons[item])-Preview")
                                .resizable()
                                .scaledToFit()
                                .frame(width: Constants.Layout.iconPreviewSize, height: Constants.Layout.iconPreviewSize)
                                .cornerRadius(Constants.Layout.iconPreviewCornerRadius)
                        }
                        .buttonStyle(.borderless)
                    }
                }
            }
            .padding(.top, Constants.Settings.iconPreviewTopPadding)
            
            Text(Constants.Strings.SettingsScreen.alternateIconsDescription)
                .frame(minWidth: .zero, maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .font(.footnote)
                .padding(.bottom, Constants.Settings.iconPreviewBottomPadding)
        }
        .listRowSeparator(.hidden)
    }
    
    private func FooterView() -> some View {
        Section(header: Text(Constants.Strings.SettingsScreen.aboutHeader),
                footer: HStack {
            Spacer()
            Text(Constants.Strings.SettingsScreen.copyright)
            Spacer()
        }
            .padding(.vertical, Constants.Settings.footerVerticalPadding)
        ) {
            
            CustomListRowView(
                rowLabel: Constants.Strings.SettingsScreen.AppInfo.application,
                rowIcon: "apps.iphone",
                rowContent: Constants.Strings.SettingsScreen.AppInfo.applicationValue,
                rowTintColor: .blue
            )
            
            CustomListRowView(
                rowLabel: Constants.Strings.SettingsScreen.AppInfo.compatibility,
                rowIcon: "info.circle",
                rowContent: Constants.Strings.SettingsScreen.AppInfo.compatibilityValue,
                rowTintColor: .red
            )
            
            CustomListRowView(
                rowLabel: Constants.Strings.SettingsScreen.AppInfo.technology,
                rowIcon: "swift",
                rowContent: Constants.Strings.SettingsScreen.AppInfo.technologyValue,
                rowTintColor: .orange
            )
            
            CustomListRowView(
                rowLabel: Constants.Strings.SettingsScreen.AppInfo.appVersion,
                rowIcon: "gear",
                rowContent: Constants.Strings.SettingsScreen.AppInfo.appVersionValue,
                rowTintColor: .purple
            )
            
            CustomListRowView(
                rowLabel: Constants.Strings.SettingsScreen.AppInfo.developer,
                rowIcon: "ellipsis.curlybraces",
                rowContent: Constants.Strings.SettingsScreen.AppInfo.developerValue,
                rowTintColor: .mint
            )
            
            CustomListRowView(
                rowLabel: Constants.Strings.SettingsScreen.AppInfo.designer,
                rowIcon: "paintpalette",
                rowContent: Constants.Strings.SettingsScreen.AppInfo.designerValue,
                rowTintColor: .pink
            )
            
            CustomListRowView(
                rowLabel: Constants.Strings.SettingsScreen.AppInfo.website,
                rowIcon: "globe",
                rowTintColor: .indigo,
                rowLinkLabel: Constants.Strings.SettingsScreen.AppInfo.websiteValue,
                rowLinkDestination: Constants.Strings.SettingsScreen.AppInfo.websiteURL
            )
        }
    }
}



#Preview {
    SettingsScreen()
}
