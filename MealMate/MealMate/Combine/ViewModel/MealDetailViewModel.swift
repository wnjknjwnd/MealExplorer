//
//  MealDetailViewModel.swift
//  MealMate
//
//  Created by Amulya Gangam on 8/06/24.
//

import Foundation
import Combine

/// ViewModel for managing and fetching detailed meal data.
final class MealDetailViewModel: ObservableObject {
    var mealNetworking: MealProtocol
    var cancellable =  Set<AnyCancellable>()
    @Published var mealDetails: MealDetail?
    @Published var errorMessage: String?
    
    init(mealNetworking: MealProtocol = MealNetworking()) {
        self.mealNetworking = mealNetworking
    }
    
    func fetchMealDetail(id: String) {
        guard URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(id)") != nil else {
            return
        }
        mealNetworking.fetchMealDetail(id: id)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
                
            }
                  , receiveValue: { [weak self] fetchedMealDetail in
                guard let self = self else { return }
                self.mealDetails = fetchedMealDetail.first
                
            }
            ).store(in: &cancellable)
    }
}
