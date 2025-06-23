//
//  OverviewScreen.swift
//  IngrediScan
//
//  Created by Faramir on 25.04.25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: ViewModel
    @State private var bestRatedRecipeVisible: Bool = false
    @State private var randomRecipeVisible: Bool = false
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                ScrollView {
                    VStack {
                        let recommended = Array(self.viewModel.recipes.shuffled().prefix(4))
                        SectionView(recipes: recommended, title: "Empfohlen für dich")
                        
                        let classics = Array(self.viewModel.recipes.shuffled().filter {
                            containsTag(recipe: $0, tag: "Klassiker")
                        }.prefix(4))
                        
                        SectionView(recipes: classics, title: "Klassiker")
                        
                        let vegetarian = Array(self.viewModel.recipes.shuffled().filter {
                            containsTag(recipe: $0, tag: "Vegetarisch")
                        }.prefix(4))
                        SectionView(recipes: vegetarian, title: "Vegetarisch")
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                //MARK: Best Rated Recipe
                ToolbarItem(placement: .cancellationAction) {
                    CircularButton(size: 20, padding: 10, color: Color.orange.opacity(0.75), image: "heart.fill") {
                        bestRatedRecipeVisible.toggle()
                    }
                    .sheet(isPresented: $bestRatedRecipeVisible) {
                        let bestRatedRecipe = $viewModel.recipes.sorted {
                            $0.wrappedValue.rating > $1.wrappedValue.rating
                        }.first
                        
                        RecipeDetailView(recipe: bestRatedRecipe!)
                    }
                }
                
                //MARK: Title
                ToolbarItem(placement: .principal) {
                    Text("Rezepte")
                        .font(.title .bold() .smallCaps())
                }
                
                //MARK: Random Recipe
                ToolbarItem(placement: .confirmationAction) {
                    CircularButton(size: 20, padding: 10, color: Color.orange.opacity(0.75), image: "shuffle") {
                        randomRecipeVisible.toggle()
                    }
                    .sheet(isPresented: $randomRecipeVisible) {
                        RecipeDetailView(recipe: $viewModel.recipes.shuffled().first!)
                            .presentationBackgroundInteraction(.disabled)
                    }
                }
            }
        }
    }
    
    private func containsTag(recipe: Recipe, tag: String) -> Bool {
        return recipe.hasTags.contains { $0.Tag.name == tag }
    }
}

#Preview {
    HomeView()
        .withPreviewEnvironmentObjects()
}
