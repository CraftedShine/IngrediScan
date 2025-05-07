//
//  CookingStatistics.swift
//  IngrediScan
//
//  Created by Faramir on 29.04.25.
//

import SwiftUI

struct CookingStatistics: View {
    private var recipe: Recipe
    
    public init(recipe: Recipe) {
        self.recipe = recipe
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Statistics")
                .font(.subheadline .smallCaps() .bold())
                .foregroundColor(.secondary)
            // Working Time
            HStack(alignment: .top) {
                Text("Arbeitszeit:")
                    .font(.callout .bold())
                Text(recipe.workingTime)
            }
            HStack() {
                Text("Schwierigkeitsgrad:")
                    .font(.callout .bold())
                Text(recipe.difficulty.rawValue)
            }
            HStack() {
                Text("kcal pro Portion:")
                    .font(.callout .bold())
                Text("\(recipe.calories) kcal")
            }
        }
    }
}

#Preview {
    CookingStatistics(recipe: BurgerMock())
}
