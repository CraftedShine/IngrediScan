//
//  RecipeViewModel.swift
//  IngrediScan
//
//  Created by Faramir on 21.05.25.
//

import Foundation

class RecipeViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var categories: [Category] = [Category(name: "Pizza"), Category(name: "Pasta"), Category(name: "Salat"), Category(name: "Dessert")]
    private var service: RecipeService = RecipeService()
    
    init() {
        self.recipes = service.loadRecipes()
    }
}
