//
//  InstructionsCardView.swift
//  MealMate
//
//  Created by Amulya Gangam on 8/06/24.
//

import SwiftUI

/// A view that displays the instructions for preparing the meal.
/// - parameter instructions: The instructions for preparing the meal.
struct InstructionsView: View {
    var instructions: String
    
    /// A function to split the instructions into individual sentences for display.
    /// - parameter instructions: The full instructions as a single string.
    /// - returns: An array of individual instruction sentences.
    private func splitInstructions(_ instructions: String) -> [String] {
        instructions
            .split(separator: ".")
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(splitInstructions(instructions), id: \.self) { instruction in
                InstructionsCardView(instructions: instruction)
            }
        }
        .padding()
        .background(Color.white.opacity(0.8))
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

/// A card view that displays an instruction with a  customised bullet point.
struct InstructionsCardView: View {
    var instructions: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(LinearGradient(gradient: Gradient(colors: [Color.pink.opacity(0.2), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .shadow(radius: 5)
            
            HStack(alignment: .top, spacing: 10) {
                DessertBulletPointView()
                    .frame(width: 16, height: 16)
                    .padding(.top, 5)
                Text(instructions)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color(.sRGB, red: 0.4, green: 0.2, blue: 0.3, opacity: 1.0))
                    .truncationMode(.tail)
                    .padding([.leading, .trailing, .bottom], 8)
                Spacer()
            }
            .padding()
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
    }
}
