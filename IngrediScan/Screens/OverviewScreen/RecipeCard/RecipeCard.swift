//
//  RecipeCard.swift
//  IngrediScan
//
//  Created by Faramir on 07.05.25.
//

import SwiftUI

struct RecipeCard: View {
    private var recipe: Recipe
    
    public init(recipe: Recipe) {
        self.recipe = recipe
    }
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                Image(recipe.image)
                    .resizable()
                    .frame(width: .infinity)
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(15)
                    .padding(.horizontal)
                
                Text(recipe.name)
                    .font(.title .bold() .smallCaps())
                    .padding(.vertical)
            }
            
            StatisticsSection(recipe: recipe)
                .padding(.leading)
            
            IngredientsSection(recipe: recipe)
                .padding(.leading)
        }
    }
}

#Preview {
    RecipeCard(recipe: PizzaMock())
}
