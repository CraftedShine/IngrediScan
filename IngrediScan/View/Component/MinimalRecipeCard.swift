//
//  MinimalRecipeCard.swift
//  IngrediScan
//
//  Created by Faramir on 09.05.25.
//

import SwiftUI

struct MinimalRecipeCard: View {
    @Binding var viewModel: AppDataViewModel
    @Binding var recipe: Recipe
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            
            
            Image(self.recipe.imageName)
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
                        self.viewModel.addFavorite(recipe: self.recipe)
                    } label: {
                        Image(systemName: self.viewModel.isFavorite(recipe: self.recipe) ? "star.fill" : "star")
                            .foregroundStyle(.yellow)
                    }
                }
                HStack {
                    Text(self.recipe.category)
                        .font(.subheadline .bold() .smallCaps())
                        .foregroundStyle(.white.opacity(0.8))
                    Text("⭐ \(String(self.recipe.rating))")
                        .font(.subheadline .bold())
                        .foregroundStyle(.white.opacity(0.8))
                }
            }
            .padding()
        }
        .cornerRadius(16)
        .shadow(radius: 5)
        .padding()
    }
}

#Preview {
    MinimalRecipeCard(viewModel: .constant(AppDataViewModel()), recipe: .constant(AppDataViewModel().recipes.first!), )
}
