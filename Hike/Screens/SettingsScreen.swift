//
//  SettingsScreen.swift
//  Hike
//
//  Created by Denis Yaremenko on 06.06.2025.
//

import SwiftUI

struct SettingsScreen: View {
    
    private let alternateAppIcons: [String] = [
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom",
        "AppIcon-Camera",
        "AppIcon-Backpack",
        "AppIcon-Campfire"
    ]
    
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
                    .font(.system(size: 80, weight: .black))
                
                VStack(spacing: -10) {
                    Text("Hike")
                        .font(.system(size: 66, weight: .black))
                    Text("Editors` Choice")
                        .fontWeight(.medium)
                }
                
                Image(systemName: "laurel.trailing")
                    .font(.system(size: 80, weight: .black))
                
                Spacer()
            }
            .foregroundStyle(
                LinearGradient(
                    colors: [.customGreenLight, .customGreenMedium, .customGreenDark],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .padding(.top, 8)
            
            VStack(spacing: 8) {
                Text("Where can you find \nperfect tracks?")
                    .font(.title2)
                    .fontWeight(.heavy)
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. In accumsan libero risus. Suspendisse vulputate lobortis augue at vehicula. Proin et aliquam nibh. Fusce vel consectetur purus. Nunc scelerisque mi ut sem tincidunt, in pharetra velit convallis.")
                    .font(.footnote)
                    .italic()
                
                Text("Dust off the boots. It is time for a walk!")
                    .fontWeight(.heavy)
                    .foregroundColor(.customGreenMedium)
            }
            .multilineTextAlignment(.center)
            .padding(.bottom, 16)
            .frame(maxWidth: .infinity)
        }
        .listRowSeparator(.hidden)
    }
    
    private func MiddleContentView() -> some View {
        Section(header: Text("Alternate Icons")) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(alternateAppIcons.indices, id: \.self) { item in
                        Button {
                            UIApplication.shared.setAlternateIconName(alternateAppIcons[item]) { error in
                                if error != nil {
                                    print("Failed request to update the app`s icon: \(String(describing: error?.localizedDescription))")
                                } else {
                                    print("Success changed app icon")
                                }
                                
                            }
                        } label: {
                            Image("\(alternateAppIcons[item])-Preview")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(16)
                        }
                        .buttonStyle(.borderless)
                    }
                }
            }
            .padding(.top, 12)
            
            Text("Choose your favourite app icon from the collection above")
                .frame(minWidth: .zero, maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .font(.footnote)
                .padding(.bottom, 12)
        }
        .listRowSeparator(.hidden)
    }
    
    private func FooterView() -> some View {
        Section(header: Text("About the app"),
                footer: HStack {
            Spacer()
            Text("Copyright © All right reserved.")
            Spacer()
        }
            .padding(.vertical, 8)
        ) {
            
            CustomListRowView(
                rowLabel: "Application",
                rowIcon: "apps.iphone",
                rowContent: "Hike",
                rowTintColor: .blue
            )
            
            CustomListRowView(
                rowLabel: "Compatibility",
                rowIcon: "info.circle",
                rowContent: "iOS",
                rowTintColor: .red
            )
            
            CustomListRowView(
                rowLabel: "Technology",
                rowIcon: "swift",
                rowContent: "Swift",
                rowTintColor: .orange
            )
            
            CustomListRowView(
                rowLabel: "App version",
                rowIcon: "gear",
                rowContent: "1.0",
                rowTintColor: .purple
            )
            
            CustomListRowView(
                rowLabel: "Developer",
                rowIcon: "ellipsis.curlybraces",
                rowContent: "Alex Chacku",
                rowTintColor: .mint
            )
            
            CustomListRowView(
                rowLabel: "Designer",
                rowIcon: "paintpalette",
                rowContent: "Nestor Ivan",
                rowTintColor: .pink
            )
            
            CustomListRowView(
                rowLabel: "Website",
                rowIcon: "globe",
                rowTintColor: .indigo,
                rowLinkLabel: "Credo Academy",
                rowLinkDestination: "https://www.gmail.com"
            )
        }
    }
}



#Preview {
    SettingsScreen()
}
