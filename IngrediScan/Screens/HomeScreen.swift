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
                        SectionView(recipes: viewModel.recipes.shuffled(), title: "Empfohlen für dich")
                        SectionView(recipes: viewModel.recipes.shuffled().filter {
                            containsTag(recipe: $0, tag: "Klassiker")
                        }, title: "Klassiker")
                        SectionView(recipes: viewModel.recipes.shuffled().filter {
                            containsTag(recipe: $0, tag: "Vegetarisch")
                        }, title: "Vegetarisch")
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                //MARK: Best Rated Recipe
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        bestRatedRecipeVisible.toggle()
                    } label: {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .padding(10)
                            .foregroundStyle(.white)
                            .background(Color.orange.opacity(0.75))
                            .clipShape(Circle())
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
                    Button {
                        randomRecipeVisible.toggle()
                    } label: {
                        Image(systemName: "shuffle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .padding(10)
                            .foregroundStyle(.white)
                            .background(Color.orange.opacity(0.75))
                            .clipShape(Circle())
                    }
                    .sheet(isPresented: $randomRecipeVisible) {
                        RecipeDetailView(recipe: $viewModel.recipes.shuffled().first!)
                    }
                }
            }
        }
    }
    
    private func containsTag(recipe: Recipe, tag: String) -> Bool {
        return recipe.hasTags.filter {
            $0.Tag.name == tag
        }.isEmpty
    }
}

#Preview {
    HomeView()
}
