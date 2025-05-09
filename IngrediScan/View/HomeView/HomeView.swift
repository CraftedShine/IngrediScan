//
//  OverviewScreen.swift
//  IngrediScan
//
//  Created by Faramir on 25.04.25.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText: String = ""
    @Binding var selectedRecipe: Recipe
    @Binding var selectedTab: Int
    
    var body: some View {
        NavigationView {
            RecipeListView(recipes: [PizzaMock(), BurgerMock(), PastaMock(), SushiMock()], selectedRecipe: $selectedRecipe, selectedTab: $selectedTab)
            
                .searchable(text: $searchText)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Recipes")
                            .font(.title .bold() .smallCaps())
                    }
                }
        }
    }
}

#Preview {
    HomeView(selectedRecipe: .constant(BurgerMock()), selectedTab: .constant(0))
}
