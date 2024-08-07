//
//  NetworkingError.swift
//  MealMate
//
//  Created by Amulya Gangam on 8/06/24.
//

import Foundation

enum NetworkingError: Error {
    case invalidURL
    case decodingFailed
    case requestFailed
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "URL provided is invalid"
        case .requestFailed:
            return "The network request failed. Please try again."
        case .decodingFailed:
            return "Failed to decode the response"
        case .unknown:
            return "An unknown error occured. Please try again."
            
        }
        
    }
}
