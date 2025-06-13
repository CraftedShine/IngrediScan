//
//  MyFridge.swift
//  IngrediScan
//
//  Created by Faramir on 02.05.25.
//

import Foundation

class MyFridge: ObservableObject {
    @Published private var ingredients: [IngredientInFridge] = []
    
    func addIngredient(_ newIngredient: IngredientInFridge) {
        if ingredients.firstIndex(where: { $0.name == newIngredient.name }) != nil {
        } else {
            ingredients.append(newIngredient)
        }
    }
    
    func removeIngredient(ingredient: IngredientInFridge) {
        ingredients.removeAll { $0.id == ingredient.id }
    }
    
    func getIngredients() -> [IngredientInFridge] {
        return ingredients
    }
}
