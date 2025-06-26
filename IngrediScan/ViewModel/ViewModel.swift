//
//  RecipeViewModel.swift
//  IngrediScan
//
//  Created by Faramir on 21.05.25.
//

import Foundation
import SwiftUI
import SwiftData
import Supabase

@MainActor
class ViewModel: ObservableObject {
    private let favoritesKey = "favoriteRecipes"
    
    @Published var recipes: [Recipe] = []
    @Published var favoriteIDs: [Int] = []
    @Published var categories: [Category] = []
    @Published var ingredients: [Ingredient] = []
    @Published var tags: [Tag] = []
    
    init() {
#if targetEnvironment(simulator)
        recipes = [Recipe.spaghettiCarbonara, Recipe.pizzaMargherita, Recipe.caesarSalad, Recipe.cheesecake].shuffled()
        tags = [Tag.italian, Tag.classic, Tag.vegetarian, Tag.light, Tag.sweet, Tag.oven]
        categories = [Category.pasta, Category.pizza, Category.salad, Category.dessert]
        ingredients = [Ingredient(id: 9, name: "Quark", unitId: 2, icon: "🥛", unit: Unit(id: 2, name: "g")), Ingredient(id: 10, name: "Zucker", unitId: 2, icon: "🧂", unit: Unit(id: 2, name: "g")), Ingredient(id: 11, name: "Eier", unitId: 1, icon: "🥚", unit: Unit(id: 1, name: "Stk"))]
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
        self.loadFavorites()
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
    
    func loadFavorites() {
        favoriteIDs = UserDefaults.standard.array(forKey: favoritesKey) as? [Int] ?? []
    }
    
    func getIngredient(_ id: Int) -> Ingredient? {
        return ingredients.first(where: { $0.id == id })
    }
    
    // MARK: - Save Favorites
    private func saveFavorites() {
        UserDefaults.standard.set(favoriteIDs, forKey: favoritesKey)
    }
    
    // MARK: - Add / Remove Favorite
    func toggleFavorite(for recipe: Recipe) {
        if let index = favoriteIDs.firstIndex(of: recipe.id) {
            favoriteIDs.remove(at: index)
        } else {
            favoriteIDs.append(recipe.id)
        }
        saveFavorites()
    }
    
    // MARK: - Is Favorite?
    func isFavorite(_ recipe: Recipe) -> Bool {
        favoriteIDs.contains(recipe.id)
    }
    
    // MARK: - Filtered Recipes
    var favoriteRecipes: [Recipe] {
        recipes.filter { favoriteIDs.contains($0.id) }
    }
}
