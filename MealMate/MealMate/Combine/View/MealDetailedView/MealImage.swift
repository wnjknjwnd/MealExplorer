//
//  MealImage.swift
//  MealMate
//
//  Created by Amulya Gangam on 8/06/24.
//

import SwiftUI

/// A component to display the meal image.
struct MealImage: View {
    var mealDetail: MealDetail
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: mealDetail.strMealThumb)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width - 40, height: 300)
                        .cornerRadius(20)
                        .shadow(radius: 10)
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width - 40, height: 300)
                        .cornerRadius(20)
                        .shadow(radius: 10)
                case .empty:
                    ProgressView()
                        .frame(width: UIScreen.main.bounds.width - 40, height: 300)
                @unknown default:
                    EmptyView()
                        .frame(width: UIScreen.main.bounds.width - 40, height: 300)
                }
            }
            
            LinearGradient(
                gradient: Gradient(colors: [Color.black.opacity(0.6), Color.clear]),
                startPoint: .bottom,
                endPoint: .top
            )
            .cornerRadius(20)
        }
        .frame(width: UIScreen.main.bounds.width - 40, height: 300)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.white, lineWidth: 4)
        )
        .shadow(color: .pink.opacity(0.5), radius: 30)
    }
}
