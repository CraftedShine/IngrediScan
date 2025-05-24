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
                    if(self.viewModel.recipes.filter{$0.isFavorite}.isEmpty) {
                        Text("No Recipes marked as Favorite")
                            .font(.callout .bold() .smallCaps())
                            .foregroundStyle(.secondary)
                    }
                    
                    ForEach(self.filteredRecipes, id: \.wrappedValue.id) { $recipe in
                        if($recipe.wrappedValue.isFavorite) {
                            RecipeCard(recipe: $recipe)
                                .padding()
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("Favoriten")
                            .font(.title .bold() .smallCaps())
                    }
                }
                .searchable(text: $searchText)
            }
        }
    }
    
    var filteredRecipes: [Binding<Recipe>] {
        $viewModel.recipes.indices.compactMap { index in
            let recipe = $viewModel.recipes[index]
            
            if searchText.isEmpty || recipe.name.wrappedValue.localizedCaseInsensitiveContains(searchText) || !recipe.tags.wrappedValue.filter({$0 .localizedCaseInsensitiveContains(searchText)}).isEmpty {
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
