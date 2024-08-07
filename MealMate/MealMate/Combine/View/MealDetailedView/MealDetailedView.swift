//
//  MealDetailedView.swift
//  MealMate
//
//  Created by Amulya Gangam on 8/06/24.
//

import SwiftUI

/// A view that displays detailed information about a meal.
struct MealDetailedView: View {
    let mealId: String
    @ObservedObject var mealDetailedViewModel = MealDetailViewModel()
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background gradient
                BackgroundGradient()
                
                if let mealDetail = mealDetailedViewModel.mealDetails {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 20) {
                            MealHeader(mealDetail: mealDetail)
                            MealImage(mealDetail: mealDetail)
                            
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
                        .onAppear {
                            mealDetailedViewModel.fetchMealDetail(id: mealId)
                        }
                }
            }
        }
    }
}

#Preview {
    MealDetailedView(mealId: "53049")
}
