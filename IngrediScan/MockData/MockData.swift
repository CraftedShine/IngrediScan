//
//  MockRecipe.swift
//  IngrediScan
//
//  Created by Fynn Schotten on 29.04.25.
//

import Foundation

class MockFridge: MyFridge {
    public override init() {
        super.init()
        let ingredients: [Ingredient] = RecipeViewModel().recipes.first!.ingredients
        
        ingredients.forEach { ingredient in
            self.addIngredient(ingredient)
        }
    }
}
