//
//  IngredientList.swift
//  IngrediScan
//
//  Created by Faramir on 29.04.25.
//

import SwiftUI

struct IngredientList: View {
    @State private var recipe: Recipe
    
    init(recipe: Recipe) {
        self.recipe = recipe
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Ingredients")
                .font(.subheadline .smallCaps() .bold())
                .foregroundColor(.secondary)
            
            ForEach(self.recipe.ingredients) { ingredient in
                HStack {
                    Text(ingredient.name + ":")
                        .font(.headline .bold() .smallCaps())
                    Text("\(String(ingredient.amount)) \(ingredient.unit)")
                        .font(.subheadline .bold())
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
}

#Preview {
    IngredientList(recipe: BurgerMock())
}
