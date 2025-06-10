//
//  CategoryView.swift
//  IngrediScan
//
//  Created by Faramir on 09.06.25.
//

import SwiftUI

struct CategoryView: View {
    @Binding var recipes: [Recipe]
    var category: Category
    
    var body: some View {
        if !filteredRecipes.isEmpty {
            VStack(alignment: .leading, spacing: 0) {
                Text(category.name)
                    .font(.title2 .bold() .smallCaps())
                    .foregroundStyle(.secondary)
                    .padding(.leading)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(filteredRecipes) { $recipe in
                            if (ofTag(recipe: recipe)) {
                                RecipeCard(recipe: $recipe)
                                    .scaledToFit()
                                    .frame(maxWidth: 400)
                            }
                        }
                    }
                }
            }
        }
    }
    
    var filteredRecipes: [Binding<Recipe>] {
        $recipes.indices.compactMap { index in
            let recipe = $recipes[index]
            
            if (ofTag(recipe: recipe.wrappedValue)) {
                return recipe
            } else {
                return nil
            }
        }
    }
    
    func ofTag(recipe: Recipe) -> Bool {
        if recipe.hasTags == nil { return false }
        
        return recipe.hasTags!.contains { element in
            return element.Tag.name == category.name
        }
    }
}

#Preview {
    CategoryView(recipes: .constant(ViewModel().recipes), category: Category(id: 1, name: "Pasta"))
}
