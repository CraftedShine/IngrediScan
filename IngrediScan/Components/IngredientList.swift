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
    let ingredientUsage = [UsesIngredient(id: "1", amount: 1, ingredientId: "1", ingredient: Ingredient(id: "1", name: "Spaghetti", unitId: "1", unit: Unit(id: "1", name: "Stk")))]
    IngredientList(ingredientUsage: ingredientUsage)
}
