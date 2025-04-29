//
//  MockRecipe.swift
//  IngrediScan
//
//  Created by Fynn Schotten on 29.04.25.
//

import Foundation

class PizzaMock: Recipe {
    public init() {
        super.init(name: "Italienischer Pizzateig", category: "Pizza", image: "pizza", ingredients: [
            Ingredient(name: "Wasser", amount: 500, unit: "ml"),
            Ingredient(name: "Olivenöl", amount: 25, unit: "ml"),
            Ingredient(name: "Frischhefe", amount: 40, unit: "g"),
            Ingredient(name: "Salz", amount: 20, unit: "g"),
            Ingredient(name: "Zucker", amount: 1, unit: "Prise")
        ])
    }
}

class BurgerMock: Recipe {
    public init() {
        super.init(name: "All American Burger", category: "Burger", image: "burger", ingredients: [
            Ingredient(name: "Zwiebel", amount: 0.25, unit: "Stk"),
            Ingredient(name: "Rinderhackfleisch", amount: 150, unit: "g"),
            Ingredient(name: "Burgersauce", amount: 0.25, unit: "TL"),
            Ingredient(name: "Salz & Pfeffer", amount: -1, unit: ""),
            Ingredient(name: "Pflanzenöl", amount: 0.75, unit: "EL"),
            Ingredient(name: "Schmelzkäse", amount: 1, unit: "Scheibe"),
            Ingredient(name: "Kopfsalat", amount: 1, unit: "Blatt"),
            Ingredient(name: "Tomate", amount: 0.5, unit: "Stk"),
            Ingredient(name: "Tomatenketchup", amount: 1, unit: "TL"),
            Ingredient(name: "Burgerbrötchen", amount: 1, unit: "Stk")
        ])
    }
}
