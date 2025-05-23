//
//  RecipeListView.swift
//  IngrediScan
//
//  Created by Fynn Schotten on 25.04.25.
//

import SwiftUI

struct RecipeListView: View {
    @Binding var searchText: String
    @StateObject var recipeViewModel: RecipeViewModel
    @StateObject var viewModel: AppDataViewModel
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                if (self.filteredRecipes.isEmpty) {
                    Text("No Recipes found")
                        .font(.headline .bold() .smallCaps())
                        .foregroundStyle(.secondary)
                        .padding()
                }
                VStack {
                    ForEach(self.filteredRecipes, id: \.wrappedValue.id) { $recipe in
                        RecipeCard(recipe: $recipe)
                    }
                }
            }
        }
    }
    
    var filteredRecipes: [Binding<Recipe>] {
        $recipeViewModel.recipes.indices.compactMap { index in
            let recipe = $recipeViewModel.recipes[index]
            print(recipe.wrappedValue.name)
            
            if searchText.isEmpty || recipe.name.wrappedValue.localizedCaseInsensitiveContains(searchText) || !recipe.tags.wrappedValue.filter({$0 .localizedCaseInsensitiveContains(searchText)}).isEmpty {
                return recipe
            } else {
                return nil
            }
        }
    }
}

#Preview {
    RecipeListView(searchText: .constant(""), recipeViewModel: RecipeViewModel(), viewModel: AppDataViewModel())
}
