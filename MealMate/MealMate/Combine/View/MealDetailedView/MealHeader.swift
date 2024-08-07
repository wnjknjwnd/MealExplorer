//
//  MealHeader.swift
//  MealMate
//
//  Created by Amulya Gangam on 8/06/24.
//

import SwiftUI

/// A component to display the meal header.
struct MealHeader: View {
    var mealDetail: MealDetail
    
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
