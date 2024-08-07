//
//  DessertBulletPoint.swift
//  MealMate
//
//  Created by Amulya Gangam on 8/06/24.
//

import SwiftUI

/// A view that displays a bullet point in the shape of a cupcake.
struct DessertBulletPointView: View {
    var body: some View {
        ZStack {
            // Cupcake base
            RoundedRectangle(cornerRadius: 2)
                .fill(Color.pink)
                .frame(width: 8, height: 10)
                .offset(y: 4)
            
            // Cupcake top
            Circle()
                .fill(Color.pink)
                .frame(width: 12, height: 12)
        }
    }
}
