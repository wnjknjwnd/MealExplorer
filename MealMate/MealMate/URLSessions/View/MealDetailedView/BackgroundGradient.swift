//
//  BackgroundGradient.swift
//  MealMate
//
//  Created by Amulya Gangam on 8/06/24.
//

import SwiftUI

/// A view that displays gradient background view of the meal detailed view
struct BackgroundGradient: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color(.sRGB, red: 1.0, green: 0.9, blue: 0.9, opacity: 1.0),
                Color(.sRGB, red: 0.98, green: 0.85, blue: 0.85, opacity: 1.0)
            ]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    BackgroundGradient()
}
