//
//  Ingredients.swift
//  MealMate
//
//  Created by Amulya Gangam on 8/06/24.
//

import SwiftUI

/// A component to display the ingredients.
struct Ingredients: View {
    var ingredients: [String: String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(ingredients.keys.sorted(), id: \.self) { key in
                if let measurement = ingredients[key], !measurement.isEmpty {
                    IngredientCard(ingredient: key, measurement: measurement)
                }
            }
        }
        .padding()
        .background(Color.white.opacity(0.8))
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

/// A card view that displays an ingredient and its measurement.
struct IngredientCard: View {
    var ingredient: String
    var measurement: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(LinearGradient(gradient: Gradient(colors: [Color.pink.opacity(0.2), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(height: 60)
                .shadow(radius: 5)
            
            HStack {
                Text(ingredient)
                    .font(.headline)
                    .foregroundColor(Color(.sRGB, red: 0.4, green: 0.2, blue: 0.3, opacity: 1.0))
                    .truncationMode(.tail)
                    .padding([.leading, .trailing, .bottom], 8)
                Spacer()
                Text(measurement)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding()
        }
        .padding(.horizontal)
    }
}
