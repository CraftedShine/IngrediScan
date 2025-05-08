//
//  RecipeListView.swift
//  IngrediScan
//
//  Created by Fynn Schotten on 25.04.25.
//

import SwiftUI

struct RecipeListView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var selectedRecipe: Recipe
    @Binding var selectedTab: Int
    @State private var searchText: String = ""
    
    private var recipes: [Recipe] = []
    
    public init (recipes: [Recipe], selectedRecipe: Binding<Recipe>, selectedTab: Binding<Int>) {
        self.recipes = recipes
        _selectedRecipe = selectedRecipe
        _selectedTab = selectedTab
    }
    
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ForEach(searchResults) { recipe in
                        RecipeCard(recipe: recipe, selectedRecipe: $selectedRecipe, selectedTab: $selectedTab)
                            .padding()
                    }
                }
                .searchable(text: $searchText)
            }
        }
    }
    
    var searchResults: [Recipe] {
        if searchText.isEmpty {
            return recipes
        } else {
            return recipes.filter { $0.name.contains(searchText) }
        }
    }
}

#Preview {
    RecipeListView(recipes: [PizzaMock(), BurgerMock(), PastaMock(), SushiMock()], selectedRecipe: .constant(BurgerMock()), selectedTab: .constant(0))
}
