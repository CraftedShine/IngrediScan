//
//  OverviewScreen.swift
//  IngrediScan
//
//  Created by Faramir on 25.04.25.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText: String = ""
    @StateObject var recipeViewModel: RecipeViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    ForEach($recipeViewModel.recipes) { $recipe in
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
                }
                .searchable(text: $searchText)
            }
        }
    }
}

#Preview {
    HomeView(recipeViewModel: RecipeViewModel())
}
