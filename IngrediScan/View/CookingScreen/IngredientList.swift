//
//  IngredientList.swift
//  IngrediScan
//
//  Created by Faramir on 29.04.25.
//

import SwiftUI

struct IngredientList: View {
    private var recipe: Recipe
    
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
                    Text(String(ingredient.amount))
                        .font(.callout .bold())
                    Text(ingredient.unit)
                        .font(.callout .bold())
                    Text(ingredient.name)
                }
            }
        }
    }
}

#Preview {
    IngredientList(recipe: BurgerMock())
}
