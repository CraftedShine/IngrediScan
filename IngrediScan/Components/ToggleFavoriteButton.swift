//
//  ToggleFavoriteButton.swift
//  IngrediScan
//
//  Created by Faramir on 24.05.25.
//

import SwiftUI

struct ToggleFavoriteButton: View {
    @Binding var recipe: Recipe
    
    var body: some View {
        Button {
            recipe.isFavorite.toggle()
        } label: {
            Image(systemName: recipe.isFavorite ? "star.fill" : "star")
                .foregroundColor(recipe.isFavorite ? .yellow : .white)
                .padding(10)
                .background(Color.black.opacity(0.5))
                .clipShape(Circle())
        }
        .padding(10)
    }
}

#Preview {
    ToggleFavoriteButton(recipe: .constant(RecipeViewModel().recipes.first!))
}
