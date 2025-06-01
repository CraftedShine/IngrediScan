//
//  MyFridge.swift
//  IngrediScan
//
//  Created by Faramir on 02.05.25.
//

import Foundation

class MyFridge: ObservableObject {
    @Published private var ingredients: [Ingredient] = []
    
    func addIngredient(_ newIngredient: Ingredient) {
        if let index = ingredients.firstIndex(where: { $0.name == newIngredient.name }) {
            ingredients[index].amount += newIngredient.amount
        } else {
            ingredients.append(newIngredient)
        }
    }
    
    func removeIngredient(ingredient: Ingredient) {
        ingredients.removeAll { $0.id == ingredient.id }
    }
    
    func getIngredients() -> [Ingredient] {
        return ingredients
    }
}
