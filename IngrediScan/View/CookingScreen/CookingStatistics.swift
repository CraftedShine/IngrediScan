//
//  CookingStatistics.swift
//  IngrediScan
//
//  Created by Faramir on 29.04.25.
//

import SwiftUI

struct CookingStatistics: View {
    @State private var recipe: Recipe
    
    public init(recipe: Recipe) {
        self.recipe = recipe
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Statistics")
                .font(.subheadline .smallCaps() .bold())
                .foregroundColor(.secondary)
            // Working Time
            HStack {
                Text("Arbeitszeit:")
                    .font(.headline .smallCaps() .bold())
                Text(recipe.workingTime)
                    .font(.subheadline .bold())
                    .foregroundStyle(.secondary)
            }
            HStack {
                Text("Schwierigkeitsgrad:")
                    .font(.headline .smallCaps() .bold())
                Text(recipe.difficulty.rawValue)
                    .font(.subheadline .bold())
                    .foregroundStyle(.secondary)
            }
            HStack {
                Text("kcal pro Portion:")
                    .font(.headline .smallCaps() .bold())
                Text("\(recipe.calories) kcal")
                    .font(.subheadline .bold())
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    CookingStatistics(recipe: BurgerMock())
}
