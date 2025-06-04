//
//  MinimalRecipeCard.swift
//  IngrediScan
//
//  Created by Faramir on 09.05.25.
//

import SwiftUI

struct CardBackground: View {
    @Binding var recipe: Recipe
    
    var body: some View {
        Image(self.recipe.imageUrl)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 100)
            .clipped()
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundStyle(.black.opacity(0.4))
            }
    }
}

struct CardText: View {
    @Binding var recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading) {
            // Title
            Text(self.recipe.name)
                .font(.title)
                .bold()
                .foregroundColor(.white)
                .lineLimit(1)
            
            // Rating
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
    }
}

struct RecipeCard: View {
    @Binding var recipe: Recipe
    @State var detailedView: Bool = false
    
    var body: some View {
        ZStack(alignment: .trailing) {
            
            Button {
                detailedView.toggle()
            } label: {
                ZStack(alignment: .leading) {
                    CardBackground(recipe: $recipe)
                    CardText(recipe: $recipe)
                        .padding(.leading)
                }
            }
            .cornerRadius(20)
            .shadow(radius: 5)
            .fullScreenCover(isPresented: $detailedView) {
                RecipeDetailView(recipe: self.$recipe)
            }
            
            ToggleFavoriteButton(recipe: $recipe)
        }
    }
}

#Preview {
    RecipeCard(recipe: .constant(RecipeViewModel().recipes.first! ))
}
