//
//  RecipeViewModel.swift
//  IngrediScan
//
//  Created by Faramir on 21.05.25.
//

import Foundation
import SwiftUI
import Supabase

@MainActor
class ViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var categories: [Category] = []
    @Published var ingredients: [Ingredient] = []
    @Published var tags: [Tag] = []
    
    init() {
        #if targetEnvironment(simulator)
        recipes = [Recipe.spaghettiCarbonara, Recipe.pizzaMargherita, Recipe.caesarSalad, Recipe.cheesecake].shuffled()
        tags = [Tag.italian, Tag.classic, Tag.vegetarian, Tag.light, Tag.sweet, Tag.oven]
        categories = [Category.pasta, Category.pizza, Category.salad, Category.dessert]
        ingredients = [Ingredient(id: 9, name: "Quark"), Ingredient(id: 10, name: "Zucker"), Ingredient(id: 11, name: "Eier")]
        #else
        Task {
            await loadRecipes()
        }
        Task {
            await loadTags()
        }
        Task {
            await loadCategories()
        }
        Task {
            await loadIngredients()
        }
        #endif
    }
    
    func loadRecipes() async {
        self.recipes = await DatabaseService.shared.fetchRecipes()
    }
    
    func loadTags() async {
        self.tags = await DatabaseService.shared.fetchTags()
    }
    
    func loadCategories() async {
        self.categories = await DatabaseService.shared.fetchCategories()
    }
    
    func loadIngredients() async {
        self.ingredients = await DatabaseService.shared.fetchIngredients()
    }
}
