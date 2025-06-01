//
//  MinimalRecipeCard.swift
//  IngrediScan
//
//  Created by Faramir on 09.05.25.
//

import SwiftUI

struct MinimalRecipeCard: View {
    @Binding var recipe: Recipe
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(self.recipe.imageUrl)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 100)
                .clipped()
                .overlay {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundStyle(.black.opacity(0.4))
                }
            
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text(self.recipe.name)
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .lineLimit(1)
                    
                    Button {
                        self.recipe.isFavorite.toggle()
                    } label: {
                        Image(systemName: self.recipe.isFavorite ? "bookmark.fill" : "bookmark")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .foregroundStyle(.yellow)
                    }
                }
                HStack {
                    Text(self.recipe.category.name)
                        .font(.subheadline .bold() .smallCaps())
                        .foregroundStyle(.white.opacity(0.8))
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                        Text(String(self.recipe.rating))
                            .font(.subheadline .bold())
                            .foregroundStyle(.white.opacity(0.8))
                    }
                }
            }
            .padding()
        }
        .cornerRadius(16)
        .shadow(radius: 5)
    }
}

#Preview {
    MinimalRecipeCard(recipe: .constant(RecipeViewModel().recipes.first! ))
}
