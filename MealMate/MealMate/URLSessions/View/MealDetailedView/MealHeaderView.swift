//
//  MealHeaderView.swift
//  MealMate
//
//  Created by Amulya Gangam on 8/06/24.
//

import SwiftUI

/// A view that displays the header information of a meal.
/// - parameter mealDetail: The detailed meal information.
struct MealHeaderView: View {
    var mealDetail: MDetail
    
    var body: some View {
        HStack {
            Spacer()
            Text(mealDetail.strMeal)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.vertical)
            Spacer()
        }
    }
}
