//
//  MNetworking.swift
//  MealMate
//
//  Created by Amulya Gangam on 8/06/24.
//

import Foundation

struct MNetworking: MProtocol {
    
    func fetchData<T: Decodable>(from urlString: String, responseType: T.Type) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw NetworkingError.invalidURL
        }
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                throw NetworkingError.requestFailed
            }
            
            do {
                let decodedData = try JSONDecoder().decode(responseType, from: data)
                return decodedData
            }
            catch {
                throw NetworkingError.decodingFailed
            }
        }
        catch {
            throw NetworkingError.unknown
        }
    }
    
    func fetchFoodList() async throws -> [MMeal] {
        let response: MResponse = try await fetchData(from: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert", responseType: MResponse.self)
        return response.meals
    }
    
    func fetchDetailedFoodList(id: String) async throws -> [MDetail] {
        let response: MDetailedResponse = try await fetchData(from: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(id)", responseType: MDetailedResponse.self)
        return response.meals
        
    }
    
}
