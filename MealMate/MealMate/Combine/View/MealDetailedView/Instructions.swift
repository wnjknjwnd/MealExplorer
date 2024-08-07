//
//  Instructions.swift
//  MealMate
//
//  Created by Amulya Gangam on 8/06/24.
//

import SwiftUI

/// A component to display the instructions.
struct Instructions: View {
    var instructions: String
    
    private func splitInstructions(_ instructions: String) -> [String] {
        instructions
            .split(separator: ".")
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(splitInstructions(instructions), id: \.self) { instruction in
                InstructionsCard(instructions: instruction)
            }
        }
        .padding()
        .background(Color.white.opacity(0.8))
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

/// A card view that displays an instruction with a bullet point.
struct InstructionsCard: View {
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
