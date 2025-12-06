//
//  CustomListRowView.swift
//  Hike
//
//  Created by Denis Yaremenko on 06.06.2025.
//

import SwiftUI

struct CustomListRowView: View {
    
    let rowLabel: String
    let rowIcon: String
    let rowContent: String?
    let rowTintColor: Color
    let rowLinkLabel: String?
    let rowLinkDestination: String?
    
    var body: some View {
        LabeledContent {
            if let content = rowContent {
                Text(content)
                    .foregroundColor(.primary)
                    .fontWeight(.heavy)
            } else if let linkLabel = rowLinkLabel,
                      let linkDestination = rowLinkDestination,
                      let url = URL(string: linkDestination) {
                Link(linkLabel, destination: url)
                    .foregroundColor(.pink)
                    .fontWeight(.heavy)
            } else {
                EmptyView()
            }
        } label: {
            HStack {
                
                ZStack {
                    RoundedRectangle(cornerRadius: Constants.Component.listRowCornerRadius)
                        .fill(rowTintColor)
                        .frame(width: Constants.Component.listRowIconSize, height: Constants.Component.listRowIconSize)
                    
                    Image(systemName: rowIcon)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                    
                }
                
                
                Text(rowLabel)
            }
        }
    }
}

#Preview {
    List {
        CustomListRowView(
            rowLabel: "Website",
            rowIcon: "globe",
            rowContent: nil,
            rowTintColor: .pink,
            rowLinkLabel: "Credo Academy",
            rowLinkDestination: "https://www.gmail.com"
        )
    }
}
