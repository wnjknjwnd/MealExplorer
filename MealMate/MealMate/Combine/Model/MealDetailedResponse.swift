//
//  MealDetailedResponse.swift
//  MealMate
//
//  Created by Amulya Gangam on 8/06/24.
//

import Foundation

/// Stores a list of detailed meal information fetched from an API response.
/// - parameters:
///     - meals: An array of `MDetail` objects representing the detailed meal information.
struct MealDetailedResponse: Decodable {
    var meals: [MealDetail]
}

/// Stores detailed meal information for populating UI.
/// - parameters:
///     - strMeal: A string representing the name of the meal.
///     - strInstructions: A string containing the cooking instructions for the meal.
///     - strIngredient1: A string for the first ingredient.
///     - strIngredient2: A string for the second ingredient.
///     - strIngredient3: A string for the third ingredient.
///     - strIngredient4: A string for the fourth ingredient.
///     - strIngredient5: A string for the fifth ingredient.
///     - strIngredient6: A string for the sixth ingredient.
///     - strIngredient7: A string for the seventh ingredient.
///     - strIngredient8: A string for the eighth ingredient.
///     - strIngredient9: A string for the ninth ingredient.
///     - strIngredient10: An optional string for the tenth ingredient.
///     - strIngredient11: An optional string for the eleventh ingredient.
///     - strIngredient12: An optional string for the twelfth ingredient.
///     - strIngredient13: An optional string for the thirteenth ingredient.
///     - strIngredient14: An optional string for the fourteenth ingredient.
///     - strIngredient15: An optional string for the fifteenth ingredient.
///     - strIngredient16: An optional string for the sixteenth ingredient.
///     - strIngredient17: An optional string for the seventeenth ingredient.
///     - strIngredient18: An optional string for the eighteenth ingredient.
///     - strIngredient19: An optional string for the nineteenth ingredient.
///     - strIngredient20: An optional string for the twentieth ingredient.
///     - strMealThumb: A string representing the URL of the meal's thumbnail image.
///     - strMeasure1: A string for the measurement of the first ingredient.
///     - strMeasure2: A string for the measurement of the second ingredient.
///     - strMeasure3: A string for the measurement of the third ingredient.
///     - strMeasure4: A string for the measurement of the fourth ingredient.
///     - strMeasure5: A string for the measurement of the fifth ingredient.
///     - strMeasure6: A string for the measurement of the sixth ingredient.
///     - strMeasure7: A string for the measurement of the seventh ingredient.
///     - strMeasure8: A string for the measurement of the eighth ingredient.
///     - strMeasure9: A string for the measurement of the ninth ingredient.
///     - strMeasure10: An optional string for the measurement of the tenth ingredient.
///     - strMeasure11: An optional string for the measurement of the eleventh ingredient.
///     - strMeasure12: An optional string for the measurement of the twelfth ingredient.
///     - strMeasure13: An optional string for the measurement of the thirteenth ingredient.
///     - strMeasure14: An optional string for the measurement of the fourteenth ingredient.
///     - strMeasure15: An optional string for the measurement of the fifteenth ingredient.
///     - strMeasure16: An optional string for the measurement of the sixteenth ingredient.
///     - strMeasure17: An optional string for the measurement of the seventeenth ingredient.
///     - strMeasure18: An optional string for the measurement of the eighteenth ingredient.
///     - strMeasure19: An optional string for the measurement of the nineteenth ingredient.
///     - strMeasure20: An optional string for the measurement of the twentieth ingredient.
///     - idMeal: A string representing the unique ID of the meal.
///     - id: A computed property returning the meal's ID.
///     - ingredients: A computed dictionary property combining ingredient names and their measurements
struct MealDetail: Decodable, Identifiable {
    var strMeal: String
    var strInstructions: String
    var strIngredient1: String
    var strIngredient2: String
    var strIngredient3: String
    var strIngredient4: String
    var strIngredient5: String
    var strIngredient6: String
    var strIngredient7: String
    var strIngredient8: String
    var strIngredient9: String
    var strIngredient10: String?
    var strIngredient11: String?
    var strIngredient12: String?
    var strIngredient13: String?
    var strIngredient14: String?
    var strIngredient15: String?
    var strIngredient16: String?
    var strIngredient17: String?
    var strIngredient18: String?
    var strIngredient19: String?
    var strIngredient20: String?
    var strMealThumb: String
    var strMeasure1: String
    var strMeasure2: String
    var strMeasure3: String
    var strMeasure4: String
    var strMeasure5: String
    var strMeasure6: String
    var strMeasure7: String
    var strMeasure8: String
    var strMeasure9: String
    var strMeasure10: String?
    var strMeasure11: String?
    var strMeasure12: String?
    var strMeasure13: String?
    var strMeasure14: String?
    var strMeasure15: String?
    var strMeasure16: String?
    var strMeasure17: String?
    var strMeasure18: String?
    var strMeasure19: String?
    var strMeasure20: String?
    var idMeal: String
    var id: String { idMeal }
    
    /// Combines ingredient names and their corresponding measurements into a dictionary.
    var ingredients: [String: String] {
        var ingredients = [String: String]()
        let ingredientKeys = Mirror(reflecting: self).children.filter { $0.label?.starts(with: "strIngredient") ?? false }
        let measureKeys = Mirror(reflecting: self).children.filter { $0.label?.starts(with: "strMeasure") ?? false }
        
        for (ingredient, measure) in zip(ingredientKeys, measureKeys) {
            if let ingredientName = ingredient.value as? String, !ingredientName.isEmpty,
               let measureValue = measure.value as? String, !measureValue.isEmpty {
                ingredients[ingredientName] = measureValue
            }
        }
        
        return ingredients
    }
}
