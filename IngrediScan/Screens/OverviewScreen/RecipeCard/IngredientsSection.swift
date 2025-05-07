//
//  IngredientsSection.swift
//  IngrediScan
//
//  Created by Faramir on 07.05.25.
//

import SwiftUI

struct IngredientsSection: View {
    var recipe: Recipe
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            Text("Ingredients")
                .font(.callout .smallCaps() .bold())
                .foregroundStyle(Color.gray)
            
            ForEach(recipe.ingredients) { ingredient in
                HStack {
                    Text(ingredient.name)
                        .font(.callout .bold() .smallCaps())
                    Text(String(ingredient.amount))
                    Text(ingredient.unit)
                }
            }
            
            Divider()
                .padding(.vertical)
        }
    }
}

#Preview {
    IngredientsSection(recipe: PizzaMock())
}
