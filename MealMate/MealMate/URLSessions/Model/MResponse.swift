//
//  MResponse.swift
//  MealMate
//
//  Created by Amulya on 8/06/24.
//

import Foundation

/// Stores a list of meals fetched from an API response.
/// - parameters:
///     - meals: An array of `MMeal` objects representing the meals.
struct MResponse: Decodable {
    var meals: [MMeal]
}

/// Stores meal information for populating UI.
/// - parameters:
///     - strMeal: A string representing the name of the meal.
///     - strMealThumb: A string representing the URL of the meal's thumbnail image.
///     - id: A computed property returning the meal's ID.
///     - idMeal: A string representing the unique ID of the meal.
struct MMeal: Decodable, Identifiable {
    var strMeal: String
    var strMealThumb: String
    var id: String { idMeal }
    var idMeal: String
}
