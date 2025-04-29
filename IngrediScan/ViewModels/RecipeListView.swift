//
//  RecipeListView.swift
//  IngrediScan
//
//  Created by Faramir on 25.04.25.
//

import SwiftUI

struct RecipeListView: View {
    private var recipes: [Recipe] = []
    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 300))
    ]
    
    public init(recipes: [Recipe]) {
        self.recipes = recipes
    }
    
    var body: some View {
        
            ScrollView {
                Grid( horizontalSpacing: 20, verticalSpacing: 20) {
                    ForEach(recipes) { recipe in
                        GridRow {
                            RecipeCard(recipe: recipe)
                        }
                    }
                }
        }
    }
}

#Preview {
    RecipeListView(recipes: [Recipe(name: "Pasta", image: "pasta")])
}
