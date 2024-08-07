//
//  MealViewModel.swift
//  MealMate
//
//  Created by Amulya Gangam on 8/06/24.
//

import Foundation
import Combine

/// A view model that manages fetching and storing a list of meals.
final class MealViewModel: ObservableObject {
    @Published var meals = [Meal]()
    @Published var errorMessage: String?
    var cancellable =  Set<AnyCancellable>()
    var mealNetworking: MealProtocol
    
    /// Initializes the view model with a networking protocol.
    /// - parameter mealNetworking: The networking protocol used to fetch meal data. Defaults to `MealNetworking`.
    init(mealNeworking: MealProtocol = MealNetworking()) {
        self.mealNetworking = mealNeworking
    }
    
    /// Fetches the list of meals asynchronously.
    func fetchMeal() {
        mealNetworking.fetchMeal()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion:  { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }, receiveValue: { [weak self] fetchedMeal in
                guard let self = self else { return }
                self.meals = fetchedMeal
                
            }).store(in: &cancellable)
    }
    
    
}
