//
//  RecipeViewModel.swift
//  IngrediScan
//
//  Created by Faramir on 21.05.25.
//

import Foundation
import SwiftUI

class RecipeViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var categories: [Category] = [Category(name: "Pizza"), Category(name: "Pasta"), Category(name: "Salat"), Category(name: "Dessert"), Category(name: "Auflauf")]
    @State var searchText: String = ""
    
    private var service: RecipeService = RecipeService()
    
    init() {
        self.recipes = service.loadRecipes()
    }
    
    var filteredRecipes: [Recipe] {
        recipes.indices.compactMap { index in
            let recipe = recipes[index]
            
            if searchText.isEmpty || recipe.name.localizedCaseInsensitiveContains(searchText) || !recipe.tags.filter({$0 .localizedCaseInsensitiveContains(searchText)}).isEmpty {
                return recipe
            } else {
                return nil
            }
        }
    }
}
