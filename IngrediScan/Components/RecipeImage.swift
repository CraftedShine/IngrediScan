//
//  RecipeImage.swift
//  IngrediScan
//
//  Created by Faramir on 24.05.25.
//
import SwiftUI

struct RecipeImage : View {
    @Binding var recipe: Recipe
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack {
                Image(recipe.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaledToFit()
                    .overlay(Color.black.opacity(0.3))
                
                Text(recipe.name)
                    .font(.largeTitle .bold() .smallCaps())
                    .lineLimit(1)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding()
            }
            
            ToggleFavoriteButton(recipe: $recipe)
        }
    }
}

#Preview {
    RecipeImage(recipe: .constant(RecipeViewModel().recipes[7]))
}
