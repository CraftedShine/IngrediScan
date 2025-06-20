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
    @Published var favoriteIDs: [String] = []
    @Published var categories: [Category] = []
    @Published var ingredients: [Ingredient] = []
    @Published var tags: [Tag] = []
    
    init() {
#if targetEnvironment(simulator)
        recipes = [Recipe.spaghettiCarbonara, Recipe.pizzaMargherita, Recipe.caesarSalad, Recipe.cheesecake].shuffled()
        tags = [Tag.italian, Tag.classic, Tag.vegetarian, Tag.light, Tag.sweet, Tag.oven]
        categories = [Category.pasta, Category.pizza, Category.salad, Category.dessert]
        ingredients = [Ingredient(id: "9", name: "Quark", unitId: "2", unit: Unit(id: "2", name: "g")), Ingredient(id: "10", name: "Zucker", unitId: "1", unit: Unit(id: "1", name: "Prise")), Ingredient(id: "11", name: "Eier", unitId: "1", unit: Unit(id: "1", name: "Stk"))]
        self.loadFavorites()
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
    
    private func loadRecipes() async {
        self.recipes = await DatabaseService.fetchRecipes()
    }
    
    private func loadTags() async {
        self.tags = await DatabaseService.fetchTags()
    }
    
    private func loadCategories() async {
        self.categories = await DatabaseService.fetchCategories()
    }
    
    private func loadIngredients() async {
        self.ingredients = await DatabaseService.fetchIngredients()
    }
    
    private func loadFavorites() {
        favoriteIDs = UserDefaults.standard.stringArray(forKey: favoritesKey) ?? []
    }
    
    // MARK: - Favoriten speichern
    private func saveFavorites() {
        UserDefaults.standard.set(favoriteIDs, forKey: favoritesKey)
    }
    
    // MARK: - Favorit hinzufügen/entfernen
    func toggleFavorite(for recipe: Recipe) {
        if let index = favoriteIDs.firstIndex(of: recipe.id) {
            favoriteIDs.remove(at: index)
        } else {
            favoriteIDs.append(recipe.id)
        }
        saveFavorites()
    }
    
    // MARK: - Ist Rezept ein Favorit?
    func isFavorite(_ recipe: Recipe) -> Bool {
        favoriteIDs.contains(recipe.id)
    }
    
    // MARK: - Gefilterte Favoritenrezepte
    var favoriteRecipes: [Recipe] {
        recipes.filter { favoriteIDs.contains($0.id) }
    }
}
