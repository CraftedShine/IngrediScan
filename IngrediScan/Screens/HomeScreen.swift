//
//  OverviewScreen.swift
//  IngrediScan
//
//  Created by Faramir on 25.04.25.
//

import SwiftUI

struct HomeView: View {
    @State private var filterScreenPresented: Bool = false
    @State private var searchText: String = ""
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach($viewModel.recipes) { $recipe in
                    RecipeCard(recipe: $recipe)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("Rezepte")
                            .font(.title .bold() .smallCaps())
                        Divider()
                    }
                }
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
    HomeView(viewModel: ViewModel())
}
