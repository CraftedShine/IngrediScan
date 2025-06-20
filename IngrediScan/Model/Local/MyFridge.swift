//
//  MyFridge.swift
//  IngrediScan
//
//  Created by Faramir on 02.05.25.
//

import Foundation


class MyFridge: ObservableObject {
    var ingredients: [IngredientInFridge] = []
    
    func addIngredient(_ newIngredient: IngredientInFridge) {
        if let index = ingredients.firstIndex(where: { $0.id == newIngredient.id }) {
            ingredients[index].amount += newIngredient.amount
        } else {
            ingredients.append(newIngredient)
        }
    }
    
    func removeIngredient(ingredient: IngredientInFridge) {
        ingredients.removeAll { $0.id == ingredient.id }
    }
    
    func getIngredients() -> [IngredientInFridge] {
        return ingredients.map { $0 }
    }
    
    func ingredientsMissing(recipe: Recipe) -> Int {
        var missingCount = 0
        let requiredIngredients = recipe.usesIngredients
        
        for requiredIngredient in requiredIngredients {
            if let fridgeIngredient = ingredients.first(where: { $0.id == requiredIngredient.ingredientId }){
                if fridgeIngredient.amount < requiredIngredient.amount {
                    missingCount += 1
                }
            } else {
                missingCount += 1
            }
        }
        return missingCount
    }
}

struct IngredientInFridge: Codable, Identifiable {
    let id: String
    let name: String
    var amount: Float
    let Unit: Unit
}
