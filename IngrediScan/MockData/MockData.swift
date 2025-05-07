//
//  MockRecipe.swift
//  IngrediScan
//
//  Created by Fynn Schotten on 29.04.25.
//

import Foundation

class PizzaMock: Recipe {
    public init() {
        super.init(name: "Italienischer Pizzateig", category: "Pizza", image: "pizza", workingTime: "15min", difficulty: "einfach", calories: "ca. 3489 kcal", ingredients: [
            Ingredient(name: "Wasser", amount: 500, unit: "ml", category: "Wasser"),
            Ingredient(name: "Olivenöl", amount: 25, unit: "ml", category: "Öl"),
            Ingredient(name: "Frischhefe", amount: 40, unit: "g", category: "Backwaren"),
            Ingredient(name: "Salz", amount: 20, unit: "g", category: "Gewürze"),
            Ingredient(name: "Zucker", amount: 1, unit: "Prise", category: "Gewürze")
        ])
    }
}

class BurgerMock: Recipe {
    public init() {
        super.init(name: "All American Burger", category: "Burger", image: "burger", workingTime: "20min", difficulty: "einfach", calories: "ca. 380 kcal", ingredients: [
            Ingredient(name: "Zwiebel", amount: 0.25, unit: "Stk", category: "Gemüse"),
            Ingredient(name: "Rinderhackfleisch", amount: 150, unit: "g", category: "Fleisch"),
            Ingredient(name: "Burgersauce", amount: 0.25, unit: "TL", category: "Sauce"),
            Ingredient(name: "Salz & Pfeffer", amount: -1, unit: "", category: "Gewürze"),
            Ingredient(name: "Pflanzenöl", amount: 0.75, unit: "EL", category: "Öl"),
            Ingredient(name: "Schmelzkäse", amount: 1, unit: "Scheibe", category: "Konfitüre"),
            Ingredient(name: "Kopfsalat", amount: 1, unit: "Blatt", category: "Gemüse"),
            Ingredient(name: "Tomate", amount: 0.5, unit: "Stk", category: "Gemüse"),
            Ingredient(name: "Tomatenketchup", amount: 1, unit: "TL", category: "Sauce"),
            Ingredient(name: "Burgerbrötchen", amount: 1, unit: "Stk", category: "Backwaren")
        ])
    }
}

class PizzaCategoryMock: Category {
    public init() {
        super.init(name: "Pizza", image: "pizza", recipes: [PizzaMock(), PizzaMock()])
    }
}

class BurgerCategoryMock: Category {
    public init() {
        super.init(name: "Burger", image: "burger", recipes: [BurgerMock(), BurgerMock()])
    }
}

class MockFridge: MyFridge {
    public override init() {
        super.init()
        let ingredients: [Ingredient] = [Ingredient(name: "Zwiebel", amount: 0.25, unit: "Stk", category: "Gemüse"),
        Ingredient(name: "Rinderhackfleisch", amount: 150, unit: "g", category: "Fleisch"),
        Ingredient(name: "Burgersauce", amount: 0.25, unit: "TL", category: "Sauce"),
        Ingredient(name: "Salz & Pfeffer", amount: -1, unit: "", category: "Gewürze"),
        Ingredient(name: "Pflanzenöl", amount: 0.75, unit: "EL", category: "Öl"),
        Ingredient(name: "Schmelzkäse", amount: 1, unit: "Scheibe", category: "Konfitüre"),
        Ingredient(name: "Kopfsalat", amount: 1, unit: "Blatt", category: "Gemüse"),
        Ingredient(name: "Tomate", amount: 0.5, unit: "Stk", category: "Gemüse"),
        Ingredient(name: "Tomatenketchup", amount: 1, unit: "TL", category: "Sauce"),
        Ingredient(name: "Burgerbrötchen", amount: 1, unit: "Stk", category: "Backwaren")]
        
        ingredients.forEach { ingredient in
            self.addIngredient(ingredient)
        }
    }
}
