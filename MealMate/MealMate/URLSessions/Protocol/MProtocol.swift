//
//  MProtocol.swift
//  MealMate
//
//  Created by Amulya Gangam on 8/06/24.
//

import Foundation

/// Protocol defining the methods for fetching meal data.
protocol MProtocol {
    /// Fetches a list of meals.
    /// - throws: An error if the data fetching fails.
    /// - returns: An array of `MMeal` objects representing the meals.
    func fetchFoodList() async throws -> [MMeal]
    
    /// Fetches detailed information for a specific meal by its ID.
    /// - parameter id: The unique identifier of the meal to fetch details for.
    /// - throws: An error if the data fetching fails.
    /// - returns: An array of `MDetail` objects representing the detailed meal information
    func fetchDetailedFoodList(id: String) async throws -> [MDetail]
}
