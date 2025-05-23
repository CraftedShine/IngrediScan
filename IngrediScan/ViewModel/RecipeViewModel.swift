//
//  RecipeViewModel.swift
//  IngrediScan
//
//  Created by Faramir on 21.05.25.
//

import Foundation

class RecipeViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    private var service: RecipeService = RecipeService()
    
    init() {
        self.recipes = service.loadRecipes()
    }
}
