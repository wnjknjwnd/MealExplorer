//
//  MView.swift
//  MealMate
//
//  Created by Amulya Gangam on 8/06/24.
//

import SwiftUI

/// A view that displays a grid of meal cards and navigates to a detailed view of a selected meal.
struct MView: View {
    @ObservedObject var viewModel = MViewModel()
    @State private var selectedMeal: MMeal?
    
    var body: some View {
        NavigationView {
            ZStack {
                backgroundColor
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(viewModel.meals) { meal in
                            MealRow(meal: meal)
                                .onTapGesture {
                                    withAnimation(.easeInOut) {
                                        self.selectedMeal = meal
                                    }
                                }
                        }
                    }
                    .padding()
                }
                .background(backgroundColor)
                .task {
                    await viewModel.fetchFoodList()
                }
                .navigationTitle("Desserts Menu")
                .sheet(item: $selectedMeal) { meal in
                    MDetailedView(mealId: meal.idMeal)
                }
            }
            .accentColor(Color.pink)
        }
    }
    
    private var backgroundColor: Color {
        Color(.sRGB, red: 0.98, green: 0.94, blue: 0.94, opacity: 1.0)
    }
}

/// A view that represents a single meal card in the grid.
struct MealRow: View {
    var meal: MMeal
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            mealImageView
            mealNameView
        }
        .background(cardBackgroundColor)
        .cornerRadius(12)
        .shadow(color: Color.pink.opacity(0.3), radius: 3, x: 0, y: 0)
    }
    
    /// A view that displays the meal's image.
    private var mealImageView: some View {
        AsyncImage(url: URL(string: meal.strMealThumb)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 150)
                    .clipped()
                    .cornerRadius(12)
            case .failure:
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .foregroundColor(.gray)
            @unknown default:
                EmptyView()
            }
        }
        .frame(height: 150)
        .clipped()
        .cornerRadius(12)
    }
    
    /// A view that displays the meal's name.
    private var mealNameView: some View {
        Text(meal.strMeal)
            .font(.headline)
            .foregroundColor(Color(.sRGB, red: 0.4, green: 0.2, blue: 0.3, opacity: 1.0))
            .lineLimit(1)
            .truncationMode(.tail)
            .padding([.leading, .trailing, .bottom], 8)
    }
    
    /// The background color for the meal card.
    private var cardBackgroundColor: Color {
        Color(.sRGB, red: 1.0, green: 0.98, blue: 0.98, opacity: 1.0)
    }
}

#Preview {
    MView()
}
