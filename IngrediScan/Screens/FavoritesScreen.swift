//
//  FavoritesScreen.swift
//  IngrediScan
//
//  Created by Faramir on 09.05.25.
//

import SwiftUI

struct FavoritesScreen: View {
    @EnvironmentObject var viewModel: ViewModel
    @State private var searchText: String = ""
    @State private var filterVisible: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    if(self.viewModel.favoriteRecipes.isEmpty) {
                        Text("Du hast noch keine Favoriten.")
                            .font(.callout .bold() .smallCaps())
                            .foregroundStyle(.secondary)
                    }
                    
                    ForEach(self.viewModel.favoriteRecipes) { recipe in
                        RecipeCard(recipe: recipe)
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Favoriten")
                            .font(.title .bold() .smallCaps())
                            .padding()
                    }
                }
                .searchable(text: $searchText, prompt: "Suchen")
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
    FavoritesScreen()
        .withPreviewEnvironmentObjects()
}
