//
//  MealResponse.swift
//  MealMate
//
//  Created by Amulya Gangam on 8/06/24.
//

import Foundation

/// Stores a list of meals fetched from an API response.
/// - parameters:
///     - meals: An array of `Meal` objects representing the meals.
struct MealResponse: Decodable {
    var meals: [Meal]
}

/// Stores meal information for populating UI.
/// - parameters:
///     - strMeal: A string representing the name of the meal.
///     - strMealThumb: A string representing the URL of the meal's thumbnail image.
///     - id: A computed property returning the meal's ID.
///     - idMeal: A string representing the unique ID of the meal.
struct Meal: Decodable, Identifiable {
    var strMeal: String
    var strMealThumb: String
    var id: String { idMeal }
    var idMeal: String
}
