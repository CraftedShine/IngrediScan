//
//  FavoritesScreen.swift
//  IngrediScan
//
//  Created by Faramir on 09.05.25.
//

import SwiftUI

struct FavoritesScreen: View {
    @State var viewModel: AppDataViewModel = .init()
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    if (self.viewModel.favoriteRecipes.isEmpty) {
                        Text("No Recipes in Favorites")
                            .font(.headline .bold() .smallCaps())
                            .foregroundStyle(.secondary)
                    }
                    ForEach(self.viewModel.favoriteRecipes) { recipe in
                        NavigationLink(destination: CookingScreen(recipe: recipe)) {
                            MinimalRecipeCard(recipe: recipe)
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
        }
    }
}

#Preview {
    FavoritesScreen()
}
