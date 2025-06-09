//
//  MockRecipe.swift
//  IngrediScan
//
//  Created by Fynn Schotten on 29.04.25.
//

import Foundation

class MockFridge: MyFridge {
    var ingredients: [Ingredient]
    
    public override init() {
        self.ingredients = [Ingredient(id: 1, name: "Tomaten"), Ingredient(id: 2, name: "Zwiebeln")]
    }
}

class MockIngredients {
    let stk = Unit(id: 1, name: "Stk")
    public let ingredients: [Ingredient]
    
    public init(){
        ingredients = [Ingredient(id: 1, name: "Tomaten"), Ingredient(id: 2, name: "Zwiebeln")]
    }
}

struct MockData {
    private let stk = Unit(id: 1, name: "Stk")
    private let gramm = Unit(id: 2, name: "g")
    private let prise = Unit(id: 3, name: "Prise")
    private let category = Category(id: 1, name: "Pasta")
    private let difficulty = "Einfach"
    
    private let tagsRelation: [TagRelation] = [TagRelation(id: 1, tagId: 1, Tag: Tag(id: 1, name: "TestTag"))]
    private let stepsRelation: [StepRelation] = [StepRelation(id: 1, stepId: 1, RecipeStep: RecipeStep(id: 1, title: "Test", description: "Test", duration: 20))]
    private let usesIngredients: [UsesIngredient] = [UsesIngredient(id: 1, amount: 1, ingredientId: 1, ingredient: Ingredient(id: 1, name: "Spaghetti"), unitId: 1, unit: Unit(id: 1, name: "Stk"))]
    
    var recipes: [Recipe] = []
    
    init() {
        let pizza = Recipe(id: 1, name: "Spaghetti Carbonara", imageUrl: "spaghetti-carbonara", rating: 4.9, duration: 20, calories: 450, annotation: "", difficulty: "Einfach", categoryId: 1, category: Category(id: 1, name: "Pasta"), usesIngredients: usesIngredients, hasSteps: stepsRelation, hasTags: tagsRelation)
        
        self.recipes.append(pizza)
    }
}
