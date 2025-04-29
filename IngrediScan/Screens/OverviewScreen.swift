//
//  OverviewScreen.swift
//  IngrediScan
//
//  Created by Faramir on 25.04.25.
//

import SwiftUI

struct OverviewScreen: View {
    @State private var searchText: String = ""
    let recipes: [Recipe] =  [
        Recipe(name: "Burger", image: "burger"),
        Recipe(name: "Pasta", image: "pasta"),
        Recipe(name: "Pizza", image: "pizza"),
        Recipe(name: "Soup", image: "soup"),
        Recipe(name: "Sushi", image: "sushi")
    ]
    
    var body: some View {
        NavigationView {
            RecipeListView(recipes: recipes)
        }
        .searchable(text: $searchText)
        .navigationTitle("Recipes")
    }
}

#Preview {
    OverviewScreen()
}
