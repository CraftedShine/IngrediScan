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
                        Text("No Recipes marked as Favorite")
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
                            .padding(.bottom)
                    }
                    ToolbarItem(placement: .cancellationAction) {
                        Button {
                            filterVisible.toggle()
                        } label: {
                            Image(systemName: "line.3.horizontal.decrease")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .padding(10)
                                .foregroundStyle(.white)
                                .background(Color.orange.opacity(0.75))
                                .clipShape(Circle())
                                .padding(.bottom)
                        }
                        .sheet(isPresented: $filterVisible) {
                            FilterView(tags: viewModel.tags)
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Image(systemName: "gearshape.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .padding(10)
                            .foregroundStyle(.white)
                            .background(Color.orange.opacity(0.75))
                            .clipShape(Circle())
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
    FavoritesScreen()
        .withPreviewEnvironmentObjects()
}
