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
        var ingredients: [Ingredient] = MockData().recipes.first!.ingredients
        
        for i in 0...ingredients.count-1 {
            ingredients[i].amount = 1
            self.addIngredient(ingredients[i])
        }
    }
}

class MockIngredients {
    let stk = Unit(id: 1, name: "Stk")
    public let ingredients: [Ingredient]
    
    public init(){
        ingredients = [Ingredient(id: 1, name: "a", unit: stk), Ingredient(id: 2, name: "b", unit: stk), Ingredient(id: 3, name: "c", unit: stk), Ingredient(id: 4, name: "d", unit: stk), Ingredient(id: 5, name: "e", unit: stk), Ingredient(id: 6, name: "f", unit: stk), Ingredient(id: 7, name: "g", unit: stk), Ingredient(id: 8, name: "h", unit: stk), Ingredient(id: 9, name: "i", unit: stk), Ingredient(id: 10, name: "j", unit: stk)]
    }
}

struct MockData {
    private let stk = Unit(id: 1, name: "Stk")
    private let gramm = Unit(id: 2, name: "g")
    private let prise = Unit(id: 3, name: "Prise")
    var recipes: [Recipe] = []
    
    init() {
        let pizza = Recipe(id: 1, name: "Spaghetti Carbonara", category: Category(id: 1, name: "Pasta"), imageUrl: "spaghetti-carbonara", duration: 20, difficulty: Difficulty.Easy, calories: 450, rating: 4.9, annotation: "", tags: [Tag(id: 1, name: "Italienisch"), Tag(id: 2, name: "Einfach")], steps: [RecipeStep(id: 1, title: "Spaghetti kochen", description: "Nudeln aldente kochen", duration: 10), RecipeStep(id: 2, title: "Guanciale anbraten", description: "Alternativ auch Speck", duration: 5), RecipeStep(id: 3, title: "Eier-Parmesan-Mischung zubereiten", description: "Eier schlagen, in eine Schale kippen und dann den Parmesan dazugeben", duration: 3), RecipeStep(id: 4, title: "Alles vermengen", description: "", duration: 2)], ingredients: [Ingredient(id: 1, name: "Spaghetti", unit: gramm, amount: 400), Ingredient(id: 2, name: "Eier", unit: stk, amount: 4), Ingredient(id: 3, name: "Parmesan", unit: gramm, amount: 100), Ingredient(id: 4, name: "Guanciale oder Speck", unit: gramm, amount: 150), Ingredient(id: 5, name: "Pfeffer", unit: prise, amount: 1), Ingredient(id: 6, name: "Salz", unit: prise, amount: 1)])
        
        self.recipes.append(pizza)
    }
}
