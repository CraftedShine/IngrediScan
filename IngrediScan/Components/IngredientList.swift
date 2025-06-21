//
//  IngredientList.swift
//  IngrediScan
//
//  Created by Faramir on 29.04.25.
//

import SwiftUI

struct IngredientList: View {
    let ingredientUsage: [UsesIngredient]
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            Text("Zutaten")
                .font(.subheadline.smallCaps().bold())
                .foregroundColor(.secondary)
            
            ForEach(ingredientUsage) { item in
                HStack {
                    Text("\(item.ingredient.name):")
                        .font(.headline .smallCaps() .bold())
                    Text("\(item.amount.cleanString())")
                        .font(.subheadline .bold())
                        .foregroundStyle(.secondary)
                    Text("\(item.ingredient.unit.name)")
                        .font(.subheadline .bold())
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
}

extension Float {
    func cleanString() -> String {
        self.truncatingRemainder(dividingBy: 1) == 0 ?
        String(format: "%.0f", self) : String(self)
    }
}

#Preview {
    IngredientList(ingredientUsage: Recipe.cheesecake.usesIngredients)
}
