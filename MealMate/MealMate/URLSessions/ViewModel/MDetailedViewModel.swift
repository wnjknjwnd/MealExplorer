//
//  MDetailedViewModel.swift
//  MealMate
//
//  Created by Amulya Gangam on 8/06/24.
//

import Foundation

/// ViewModel for managing and fetching detailed meal data.
final class MDetailedViewModel: ObservableObject {
    var mNetworking: MProtocol
    @Published var mDetails: MDetail?
    @Published var errorMessage: String?
    
    /// Initializes the view model with a networking protocol.
    /// - parameter mNetworking: The networking protocol used to fetch detailed meal data. Defaults to `MNetworking`.
    init(mNetworking: MProtocol = MNetworking()) {
        self.mNetworking = mNetworking
    }
    
    /// Fetches detailed information for a specific meal by its ID.
    func fetchDetailedFoodList(id: String) async {
        do {
            let fetchedMealDetails = try await mNetworking.fetchDetailedFoodList(id: id)
            DispatchQueue.main.async {
                self.mDetails = fetchedMealDetails.first
            }
        }
        catch {
            DispatchQueue.main.async {
                self.errorMessage = error.localizedDescription
            }
            print("error fetching meal details")
        }
    }
}
