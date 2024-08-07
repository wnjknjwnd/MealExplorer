//
//  MealProtocol.swift
//  MealMate
//
//  Created by Amulya Gangam on 8/06/24.
//

import Foundation
import Combine

/// Protocol defining the methods for fetching meal data using Combine publishers.
protocol MealProtocol {
    /// Fetches a list of meals.
    /// - returns: A publisher emitting an array of `Meal` objects representing the meals, or an error if the data fetching fails.
    func fetchMeal() -> AnyPublisher<[Meal], Error>
    
    /// Fetches detailed information for a specific meal by its ID.
    /// - parameter id: The unique identifier of the meal to fetch details for.
    /// - returns: A publisher emitting a `MealDetail` object representing the detailed meal information, or an error if the data fetching fails
    func fetchMealDetail(id: String) -> AnyPublisher<[MealDetail], Error>
}
