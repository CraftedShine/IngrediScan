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
    private let fridgeIngredientsKeys = "fridgeIngredientsKeys"
    
    @Published var recipes: [Recipe] = []
    @Published var categories: [Category] = []
    @Published var ingredients: [Ingredient] = []
    @Published var tags: [Tag] = []
    @Published var fridge: MyFridge = MyFridge()
    
    @Published var favoriteIDs: [String] = []
    @Published var fridgeIngredientsIDs: [String: Float] = [:]
    
    init() {
#if targetEnvironment(simulator)
        recipes = [Recipe.spaghettiCarbonara, Recipe.pizzaMargherita, Recipe.caesarSalad, Recipe.cheesecake].shuffled()
        tags = [Tag.italian, Tag.classic, Tag.vegetarian, Tag.light, Tag.sweet, Tag.oven]
        categories = [Category.pasta, Category.pizza, Category.salad, Category.dessert]
        ingredients = [Ingredient(id: "9", name: "Quark", unitId: "2", unit: Unit(id: "2", name: "g")), Ingredient(id: "10", name: "Zucker", unitId: "1", unit: Unit(id: "1", name: "Prise")), Ingredient(id: "11", name: "Eier", unitId: "1", unit: Unit(id: "1", name: "Stk"))]
        self.loadFavorites()
        self.loadFridge()
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
    
    private func loadFridge() {
        if let savedData = UserDefaults.standard.dictionary(forKey: fridgeIngredientsKeys) as? [String: Float] {
            fridgeIngredientsIDs = savedData
            fridge.ingredients.removeAll()
            
            for ingredient in ingredients {
                if let amount = fridgeIngredientsIDs[ingredient.id] {
                    let fridgeIngredient = IngredientInFridge(
                        id: ingredient.id,
                        name: ingredient.name,
                        amount: amount,
                        Unit: ingredient.unit
                    )
                    fridge.addIngredient(fridgeIngredient)
                }
            }
        }
    }
    
    private func saveFridge() {
        UserDefaults.standard.set(fridgeIngredientsIDs, forKey: fridgeIngredientsKeys)
    }
    
    public func editIngredientInFridge(ingredientId: String, amount: Float, ingredient: IngredientInFridge) {
        guard amount != 0 else { return }

        if let currentAmount = fridgeIngredientsIDs[ingredientId] {
            let newAmount = currentAmount + amount

            if newAmount <= 0 {
                fridgeIngredientsIDs.removeValue(forKey: ingredientId)
                fridge.removeIngredient(ingredient: ingredient)
            } else {
                fridgeIngredientsIDs[ingredientId] = newAmount
                fridge.addIngredient(ingredient)
            }
        } else if amount > 0 {
            fridgeIngredientsIDs[ingredientId] = amount
            fridge.addIngredient(ingredient)
        } else {
            return
        }

        saveFridge()
    }


}
