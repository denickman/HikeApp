
import SwiftUI

struct CustomBackgroundView: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        ZStack {
            Color.customGreenDark
                .clipShape(RoundedRectangle(cornerRadius: Constants.Background.cornerRadius))
                .offset(y: Constants.Background.topOffset)
            
            Color.customGreenLight
                .clipShape(RoundedRectangle(cornerRadius: Constants.Background.cornerRadius))
                .offset(y: Constants.Background.middleOffset)
                .opacity(Constants.Background.middleOpacity)
            
            LinearGradient(
                colors: Color.backgroundGradientColors(for: colorScheme),
                startPoint: .top,
                endPoint: .bottom
            )
            .clipShape(RoundedRectangle(cornerRadius: Constants.Background.cornerRadius))
        }
    }
}

#Preview {
    CustomBackgroundView()
        .padding()
}
