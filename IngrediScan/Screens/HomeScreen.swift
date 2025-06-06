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
    @StateObject var viewModel: RecipeViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    TagList(tags: viewModel.tags)
                    ForEach(self.filteredRecipes) { $recipe in
                        RecipeCard(recipe: $recipe)
                            .padding()
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("Rezepte")
                            .font(.title .bold() .smallCaps())
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            self.filterScreenPresented.toggle()
                        } label: {
                            Image(systemName: "line.3.horizontal.decrease.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .padding(.vertical)
                        }
                        .sheet(isPresented: $filterScreenPresented) {
                            FilterView()
                                .presentationDetents([.large])
                                .presentationDragIndicator(.visible)
                        }
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
    HomeView(viewModel: RecipeViewModel())
}
