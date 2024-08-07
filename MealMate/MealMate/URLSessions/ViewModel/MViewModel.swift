//
//  MViewModel.swift
//  MealMate
//
//  Created by Amulya Gangam on 8/06/24.
//

import Foundation

/// A view model that manages fetching and storing a list of meals.
final class MViewModel: ObservableObject {
    var mNetworking: MProtocol
    @Published var meals = [MMeal]()
    @Published var errorMessage: String?
    
    /// Initializes the view model with a networking protocol.
    /// - parameter mNetworking: The networking protocol used to fetch meal data. Defaults to `MNetworking`.
    init(mNetworking: MProtocol = MNetworking()) {
        self.mNetworking = mNetworking
    }
    
    /// Fetches the list of meals asynchronously.
    func fetchFoodList() async {
        do {
            let fetchedMeals = try await mNetworking.fetchFoodList()
            DispatchQueue.main.async {
                self.meals = fetchedMeals
            }
        }
        
        catch {
            DispatchQueue.main.async {
                self.errorMessage = error.localizedDescription
            }
            print("Failed to fetch meals \(error)")
        }
    }
    
}
