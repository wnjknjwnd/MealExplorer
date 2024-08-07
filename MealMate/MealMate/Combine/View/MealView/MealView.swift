//
//  MealView.swift
//  MealMate
//
//  Created by Amulya Gangam on 8/06/24.
//

import SwiftUI

/// A view that displays a grid of meal cards and navigates to a detailed view of a selected meal.
struct MealView: View {
    @ObservedObject var viewModel = MealViewModel()
    @State var selectedMeal: Meal?
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background color
                Color(.sRGB, red: 0.98, green: 0.94, blue: 0.94, opacity: 1.0)
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(viewModel.meals) { meal in
                            MealCard(meal: meal)
                                .onTapGesture {
                                    withAnimation(.easeInOut) {
                                        self.selectedMeal = meal
                                    }
                                }
                        }
                    }
                    .padding()
                }
                .background(Color(.sRGB, red: 0.98, green: 0.94, blue: 0.94, opacity: 1.0))
                .onAppear {
                    viewModel.fetchMeal()
                }
                .navigationTitle("Desserts Menu")
                .sheet(item: $selectedMeal) { meal in
                    MealDetailedView(mealId: meal.idMeal)
                }
            }
            .accentColor(Color(.sRGB, red: 1.0, green: 0.78, blue: 0.82, opacity: 1.0))
        }
    }
}

/// A view that represents a single meal card in the grid.
struct MealCard: View {
    var meal: Meal
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
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
            
            Text(meal.strMeal)
                .font(.headline)
                .foregroundColor(Color(.sRGB, red: 0.4, green: 0.2, blue: 0.3, opacity: 1.0))
                .lineLimit(1)
                .truncationMode(.tail)
                .padding([.leading, .trailing, .bottom], 8)
        }
        .background(Color(.sRGB, red: 1.0, green: 0.98, blue: 0.98, opacity: 1.0))
        .cornerRadius(12)
        .shadow(color: Color.pink.opacity(0.3), radius: 3, x: 0, y: 0)
    }
}

#Preview {
    MealView()
}
