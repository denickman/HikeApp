//
//  SettingsScreen.swift
//  Hike
//
//  Created by Denis Yaremenko on 06.06.2025.
//

import SwiftUI

struct SettingsScreen: View {
    
    @StateObject private var viewModel = SettingsViewModel()
    @EnvironmentObject private var appearanceManager: AppearanceManager
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        List {
            HeaderView()
            MiddleContentView()
            ThemeSectionView()
            FooterView()
        }
        .alert(Constants.Strings.Errors.alertTitle, isPresented: $viewModel.showError) {
            Button("OK") {
                viewModel.dismissError()
            }
        } message: {
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
            }
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
                    colors: Color.headerGradientColors(for: colorScheme),
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
                    ForEach(viewModel.alternateAppIcons.indices, id: \.self) { item in
                        Button {
                            viewModel.changeAppIcon(to: viewModel.alternateAppIcons[item])
                        } label: {
                            Image("\(viewModel.alternateAppIcons[item])-Preview")
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
    
    private func ThemeSectionView() -> some View {
        Section(header: Text("Appearance")) {
            ForEach(AppearanceTheme.allCases, id: \.self) { theme in
                Button {
                    appearanceManager.currentTheme = theme
                } label: {
                    HStack {
                        Image(systemName: theme.iconName)
                            .foregroundColor(appearanceManager.currentTheme == theme ? .customGreenMedium : .secondary)
                            .font(.system(size: 20))
                        
                        Text(theme.displayName)
                            .foregroundColor(.primary)
                        
                        Spacer()
                        
                        if appearanceManager.currentTheme == theme {
                            Image(systemName: "checkmark")
                                .foregroundColor(.customGreenMedium)
                                .fontWeight(.semibold)
                        }
                    }
                }
                .buttonStyle(.plain)
            }
        }
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
        .environmentObject(AppearanceManager.shared)
}
