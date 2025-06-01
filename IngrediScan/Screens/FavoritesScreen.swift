//
//  FavoritesScreen.swift
//  IngrediScan
//
//  Created by Faramir on 09.05.25.
//

import SwiftUI

struct FavoritesScreen: View {
    @StateObject var viewModel: RecipeViewModel
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    if (self.viewModel.recipes.filter{ $0.isFavorite }.isEmpty) {
                        Text("No Recipes marked as Favorite")
                            .font(.headline .bold() .smallCaps())
                            .foregroundStyle(.secondary)
                            .padding()
                    }
                    
                    ForEach(self.filteredRecipes, id: \.wrappedValue.id) { $recipe in
                        if recipe.isFavorite {
                            NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                                MinimalRecipeCard(recipe: $recipe)
                                    .padding()
                            }
                        }
                    }
                }
            }
            .searchable(text: $searchText)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Favoriten")
                        .font(.title .bold() .smallCaps())
                }
            }
            .toolbarBackground(Color(UIColor.secondarySystemBackground), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
    
    var filteredRecipes: [Binding<Recipe>] {
        $viewModel.recipes.indices.compactMap { index in
            let recipe = $viewModel.recipes[index]
            print(recipe.wrappedValue.name)
            
            if (searchText.isEmpty || recipe.name.wrappedValue.localizedCaseInsensitiveContains(searchText)) {
                return recipe
            } else {
                return nil
            }
        }
    }
}

#Preview {
    FavoritesScreen(viewModel: RecipeViewModel())
}
