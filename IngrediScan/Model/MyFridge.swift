//
//  MyFridge.swift
//  IngrediScan
//
//  Created by Faramir on 02.05.25.
//

import Foundation

class MyFridge {
    private var ingredients: [Ingredient] = []
    
    func addIngredient(_ ingredient: Ingredient) {
        ingredients.append(ingredient)
    }
    
    func removeIngredient(_ index: Int) {
        ingredients.remove(at: index)
    }
    
    func getIngredients() -> [Ingredient] {
        return ingredients
    }
}
