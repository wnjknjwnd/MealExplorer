//
//  MDetailedView.swift
//  MealMate
//
//  Created by Amulya Gangam on 8/06/24.
//

import SwiftUI

/// A view that displays detailed information about a meal.
struct MDetailedView: View {
    let mealId: String
    @ObservedObject var mealDetailedViewModel = MDetailedViewModel()
    
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundGradient()
                
                if let mealDetail = mealDetailedViewModel.mDetails {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 20) {
                            MealHeaderView(mealDetail: mealDetail)
                            MealImageView(mealDetail: mealDetail)
                            
                            Picker("", selection: $selectedTab) {
                                Text("Ingredients").tag(0)
                                Text("Instructions").tag(1)
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .padding(.horizontal)
                            
                            if selectedTab == 1 {
                                InstructionsView(instructions: mealDetail.strInstructions)
                            } else if selectedTab == 0 {
                                IngredientsView(ingredients: mealDetail.ingredients)
                            }
                        }
                        .padding()
                    }
                } else {
                    ProgressView()
                        .task {
                            await mealDetailedViewModel.fetchDetailedFoodList(id: mealId)
                        }
                }
            }
        }
    }
}

#Preview {
    MDetailedView(mealId: "53049")
}
