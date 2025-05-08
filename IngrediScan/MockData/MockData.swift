//
//  MockRecipe.swift
//  IngrediScan
//
//  Created by Fynn Schotten on 29.04.25.
//

import Foundation

class PizzaMock: Recipe {
    public init() {
        let ingredients = [
            Ingredient(name: "Wasser", amount: 500, unit: "ml"),
            Ingredient(name: "Olivenöl", amount: 25, unit: "ml"),
            Ingredient(name: "Frischhefe", amount: 40, unit: "g"),
            Ingredient(name: "Salz", amount: 20, unit: "g"),
            Ingredient(name: "Zucker", amount: 1, unit: "Prise")
        ]
        let steps = [RecipeStep(title: "Teig anmischen", description: "Alle Zutaten in eine Schüssel geben und verühren.", requiredIngredients: ingredients), RecipeStep(title: "Teig ziehen lassgen", description: "Teig im Kühlschrank 24h ziehen lassen", requiredIngredients: [])]
        let category = Category(name: "Pizza", image: "pizza")
        
        super.init(name: "Italienischer Pizzateig", category: category, image: "pizza", steps: steps, ingredients: ingredients, workingTime: "15 Minuten", difficulty: Difficulty.Easy, calories: 3840, rating: 4.8, tags: ["Einfach", "Italienisch"])
    }
}

class PastaMock: Recipe {
    public init() {
        let ingredients = [
            Ingredient(name: "Wasser", amount: 500, unit: "ml"),
            Ingredient(name: "Nudeln", amount: 25, unit: "ml"),
            Ingredient(name: "Tomatenmark", amount: 40, unit: "g"),
            Ingredient(name: "Salz", amount: 20, unit: "g"),
            Ingredient(name: "Pfeffer", amount: 20, unit: "g"),
            Ingredient(name: "Zucker", amount: 1, unit: "Prise")
        ]
        let steps = [RecipeStep(title: "Teig anmischen", description: "Alle Zutaten in eine Schüssel geben und verühren.", requiredIngredients: ingredients), RecipeStep(title: "Teig ziehen lassen", description: "Teig im Kühlschrank 24h ziehen lassen", requiredIngredients: [])]
        let category = Category(name: "Pasta", image: "pasta")
        
        super.init(name: "Spaghetti", category: category, image: "pasta", steps: steps, ingredients: ingredients, workingTime: "20 Minuten", difficulty: Difficulty.Easy, calories: 350, rating: 4.2, tags: ["Italienisch", "Einfach"])
    }
}

class SushiMock: Recipe {
    public init() {
        let ingredients = [
            Ingredient(name: "Wasser", amount: 500, unit: "ml"),
            Ingredient(name: "Reis", amount: 25, unit: "ml"),
            Ingredient(name: "Algenpapier", amount: 40, unit: "g"),
            Ingredient(name: "Lachs", amount: 20, unit: "g"),
        ]
        let steps = [RecipeStep(title: "Reis kochen", description: "Koche den Reis bis er klebrig ist.", requiredIngredients: ingredients), RecipeStep(title: "Sushi Rollen", description: "Reis in Algenpapier rollen & mit Lachs belegen", requiredIngredients: [])]
        let category = Category(name: "Suhsi", image: "sushi")
        super.init(name: "Lachs Sushi", category: category, image: "sushi", steps: steps, ingredients: ingredients, workingTime: "15 Minuten", difficulty: Difficulty.Medium, calories: 150, rating: 4.5, tags: ["Lecker", "Asiatisch"])
    }
}

class BurgerMock: Recipe {
    public init() {
        let ingredients = [
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
        ]
        let steps = [RecipeStep(title: "Patties", description: "Zwiebeln, Hackfleisch, Öl, Salz & Pfeffer vermengen & anbraten", requiredIngredients: ingredients), RecipeStep(title: "Buns aufbacken & Burger belegen", description: "Buns im Ofen aufbacken und dann Burger nach belieben belegen", requiredIngredients: [])]
        let category = Category(name: "Burger", image: "Burger")
        
        super.init(name: "All American Burger", category: category, image: "burger", steps: steps, ingredients: ingredients, workingTime: "25 Minuten", difficulty: Difficulty.Easy, calories: 380, rating: 5.0, tags: ["Lecker", "Einfach"])
    }
}

class PizzaCategoryMock: Category {
    public init() {
        super.init(name: "Pizza", image: "pizza")
    }
}

class BurgerCategoryMock: Category {
    public init() {
        super.init(name: "Burger", image: "burger")
    }
}

class PastaCategoryMock: Category {
    public init() {
        super.init(name: "Pasta", image: "pasta")
    }
}

class SushiCategoryMock: Category {
    public init() {
        super.init(name: "Sushi", image: "sushi")
    }
}

class MockFridge: MyFridge {
    public override init() {
        super.init()
        let ingredients: [Ingredient] = [Ingredient(name: "Zwiebel", amount: 0.25, unit: "Stk"),
        Ingredient(name: "Rinderhackfleisch", amount: 150, unit: "g"),
        Ingredient(name: "Burgersauce", amount: 0.25, unit: "TL"),
        Ingredient(name: "Salz & Pfeffer", amount: -1, unit: ""),
        Ingredient(name: "Pflanzenöl", amount: 0.75, unit: "EL"),
        Ingredient(name: "Schmelzkäse", amount: 1, unit: "Scheibe"),
        Ingredient(name: "Kopfsalat", amount: 1, unit: "Blatt"),
        Ingredient(name: "Tomate", amount: 0.5, unit: "Stk"),
        Ingredient(name: "Tomatenketchup", amount: 1, unit: "TL"),
        Ingredient(name: "Burgerbrötchen", amount: 1, unit: "Stk")]
        
        ingredients.forEach { ingredient in
            self.addIngredient(ingredient)
        }
    }
}
