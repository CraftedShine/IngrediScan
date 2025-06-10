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
            VStack {
                //MARK: Recommended Section
                VStack(alignment: .leading, spacing: 0) {
                    Text("Empfohlen für dich")
                        .font(.title2 .bold() .smallCaps())
                        .foregroundStyle(.secondary)
                        .padding(.leading)
                    TabView {
                        ForEach($viewModel.recipes.shuffled().prefix(3)) { $recipe in
                            RecipeCard(recipe: $recipe)
                                .scaledToFit()
                                .frame(maxWidth: 400)
                        }
                    }
                    .tabViewStyle(.page)
                    .indexViewStyle(.page(backgroundDisplayMode: .interactive))
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Rezepte")
                        .font(.title .bold() .smallCaps())
                }
            }
            .searchable(text: $searchText)
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
