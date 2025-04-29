//
//  RecipeView.swift
//  IngrediScan
//
//  Created by Faramir on 25.04.25.
//

import SwiftUI

struct RecipeCard: View {
    private let recipe: Recipe
    
    public init(recipe: Recipe) {
        self.recipe = recipe
    }
    
    var body: some View {
        Button() {
            print("\(recipe.name) clicked")
        } label: {
            ZStack(alignment: .center) {
                Image(recipe.image)
                    .resizable()
                    .frame(width: .infinity, height: 200)
                    .aspectRatio(contentMode: .fit)
                Text(recipe.name)
                    .font(.largeTitle .smallCaps() .bold())
                    .foregroundStyle(Color.white)
                    .shadow(color: Color.black, radius: 2, x: 0, y: 2)
            }
            .cornerRadius(15)
            .padding()
        }
    }
}

#Preview {
    RecipeCard(recipe: Recipe(name: "Pasta", image: "pasta"))
}
