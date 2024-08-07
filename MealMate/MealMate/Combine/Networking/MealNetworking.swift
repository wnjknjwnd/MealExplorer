//
//  MealNetworking.swift
//  MealMate
//
//  Created by Amulya Gangam on 8/06/24.
//

import Foundation
import Combine

struct MealNetworking: MealProtocol {
    func fetchData<T: Decodable>(from urlString: String, responseType: T.Type) -> AnyPublisher<T, Error> {
        guard let url = URL(string: urlString) else {
            return Fail(error: NetworkingError.invalidURL).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                    throw NetworkingError.requestFailed
                }
                return data
            }
            .decode(type: responseType, decoder: JSONDecoder())
            .mapError { error -> NetworkingError in
                if let urlError = error as? URLError {
                    switch urlError.code {
                    case .badURL:
                        return .invalidURL
                    default:
                        return .requestFailed
                    }
                } else if let decodingError = error as? DecodingError {
                    return .decodingFailed
                } else {
                    return .unknown
                }
            }
            .eraseToAnyPublisher()
    }
    
    func fetchMeal() -> AnyPublisher<[Meal], Error> {
        fetchData(from: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert", responseType: MealResponse.self)
            .map(\.meals)
            .eraseToAnyPublisher()
    }
    
    func fetchMealDetail(id: String) -> AnyPublisher<[MealDetail], Error> {
        fetchData(from: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(id)", responseType: MealDetailedResponse.self)
            .map(\.meals)
            .eraseToAnyPublisher()
    }
}
