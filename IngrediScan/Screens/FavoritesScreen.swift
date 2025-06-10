//
//  FavoritesScreen.swift
//  IngrediScan
//
//  Created by Faramir on 09.05.25.
//

import SwiftUI

struct FavoritesScreen: View {
    @StateObject var viewModel: ViewModel
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
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        VStack {
                            Text("Favoriten")
                                .font(.title .bold() .smallCaps())
                            Divider()
                        }
                        .padding(.bottom)
                    }
                }
                .searchable(text: $searchText)
            }
        }
    }
    
    var filteredRecipes: [Binding<Recipe>] {
        $viewModel.recipes.indices.compactMap { index in
            let recipe = $viewModel.recipes[index]
            
            if (searchText.isEmpty || recipe.name.wrappedValue.localizedCaseInsensitiveContains(searchText)) {
                return recipe
            } else {
                return nil
            }
        }
    }
}

#Preview {
    FavoritesScreen(viewModel: ViewModel())
}
