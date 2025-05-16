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
        let ingredients: [Ingredient] = AppDataViewModel().recipes.first!.ingredients
        
        ingredients.forEach { ingredient in
            self.addIngredient(ingredient)
        }
    }
}

class IngredientTemplateListMock: IngredientTemplateList {
    public override init() {
        super.init()
        let ingredientTemplates: [IngredientTemplate] = [
            IngredientTemplate(name: "Zwiebel"),
            IngredientTemplate(name: "Rinderhackfleisch"),
            IngredientTemplate(name: "Burgersauce"),
            IngredientTemplate(name: "Salz & Pfeffer"),
            IngredientTemplate(name: "Pflanzenöl"),
            IngredientTemplate(name: "Schmelzkäse"),
            IngredientTemplate(name: "Kopfsalat"),
            IngredientTemplate(name: "Tomate"),
            IngredientTemplate(name: "Tomatenketchup"),
            IngredientTemplate(name: "Burgerbrötchen")
            
        ]
        
        ingredientTemplates.forEach { ingredientTemplate in
            self.addIngredientTemplate(ingredientTemplate)
        }
    }
}
