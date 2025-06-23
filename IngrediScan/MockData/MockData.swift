//
//  MockRecipe.swift
//  IngrediScan
//
//  Created by Fynn Schotten on 29.04.25.
//

import Foundation

class MockFridge: MyFridge {
    override init() {
        super.init()

        let stk = Unit(id: 1, name: "Stk")
        addIngredient(IngredientInFridge(id: 0, name: "Eier", amount: 6, Unit: stk))
        addIngredient(IngredientInFridge(id: 1, name: "Milch", amount: 1, Unit: stk))
        addIngredient(IngredientInFridge(id: 2, name: "Käse", amount: 0.5, Unit: stk))
    }
}

class MockIngredients {
    let stk = Unit(id: 1, name: "Stk")
    public let ingredients: [Ingredient]
    
    public init(){
        ingredients = [Ingredient(id: 0, name: "Eier", unitId: 1, unit: stk),Ingredient(id: 3, name: "Tomaten", unitId: 1, unit: stk),Ingredient(id: 4, name: "Zwiebeln", unitId: 1, unit: stk),Ingredient(id: 5, name: "Knoblauch", unitId: 1, unit: stk),Ingredient(id: 6, name: "Garam ma Sala", unitId: 1, unit: stk),Ingredient(id: 7, name: "Salat", unitId: 1, unit: stk),Ingredient(id: 8, name: "Zucker", unitId: 1, unit: stk),Ingredient(id: 9, name: "Mehl", unitId: 1, unit: stk),Ingredient(id: 10, name: "Pfeffer", unitId: 1, unit: stk),Ingredient(id: 11, name: "Bananen", unitId: 1, unit: stk), Ingredient(id: 1, name: "Spaghetti", unitId: 1, unit: Unit(id: 1, name: "g")), Ingredient(id: 2, name: "Speck", unitId: 1, unit: Unit(id: 1, name: "g"))]
    }
}

extension Category {
    static var pasta: Category {
        Category(id: 1, name: "Pasta")
    }
    
    static var pizza: Category {
        Category(id: 2, name: "Pizza")
    }
    
    static var salad: Category {
        Category(id: 3, name: "Salat")
    }
    
    static var dessert: Category {
        Category(id: 4, name: "Dessert")
    }
}

extension Tag {
    static var italian: Tag {
        Tag(id: 1, name: "Italienisch")
    }
    
    static var classic: Tag {
        Tag(id: 2, name: "Klassiker")
    }
    
    static var vegetarian: Tag {
        Tag(id: 3, name: "Vegetarisch")
    }
    
    static var light: Tag {
        Tag(id: 4, name: "Leicht")
    }
    
    static var sweet: Tag {
        Tag(id: 5, name: "Süß")
    }
    
    static var oven: Tag {
        Tag(id: 6, name: "Ofen")
    }
}

extension Recipe {
    static var spaghettiCarbonara: Recipe {
        Recipe(
            id: 1,
            name: "Spaghetti Carbonara",
            imageUrl: "spaghetti-carbonara",
            rating: 4.8,
            duration: 25,
            calories: 700,
            annotation: "Italienischer Klassiker",
            difficulty: "Einfach",
            
            categoryId: 1,
            category: Category(id: 1, name: "Pasta"),
            
            usesIngredients: [
                UsesIngredient(
                    id: 1,
                    amount: 250,
                    ingredientId: 1,
                    ingredient: Ingredient(id: 1, name: "Spaghetti", unitId: 1,
                                           unit: Unit(id: 1, name: "g"))
                ),
                UsesIngredient(
                    id: 2,
                    amount: 100,
                    ingredientId: 2,
                    ingredient: Ingredient(id: 2, name: "Speck", unitId: 1,
                                           unit: Unit(id: 1, name: "g"))
                    
                )
            ],
            
            hasSteps: [
                StepRelation(
                    id: 1,
                    stepId: 1,
                    RecipeStep: RecipeStep(id: 1, title: "Spaghetti kochen", description: "In Salzwasser 8–10 Minuten garen.", duration: 10)
                ),
                StepRelation(
                    id: 2,
                    stepId: 2,
                    RecipeStep: RecipeStep(id: 2, title: "Soße zubereiten", description: "Speck anbraten, Eier und Käse verrühren.", duration: 10)
                )
            ],
            
            hasTags: [
                TagRelation(id: 1, tagId: 1, Tag: Tag.italian),
                TagRelation(id: 2, tagId: 2, Tag: Tag.classic)
            ]
        )
    }
    
    static var pizzaMargherita: Recipe {
        Recipe(
            id: 2,
            name: "Pizza Margherita",
            imageUrl: "pizza",
            rating: 4.6,
            duration: 60,
            calories: 900,
            annotation: "Klassische italienische Pizza",
            difficulty: "Mittel",
            categoryId: 2,
            category: Category(id: 2, name: "Pizza"),
            usesIngredients: [
                UsesIngredient(id: 3, amount: 500, ingredientId: 3, ingredient: Ingredient(id: 3, name: "Mehl", unitId: 1, unit: Unit(id: 1, name: "g"))),
                UsesIngredient(id: 4, amount: 300, ingredientId: 4, ingredient: Ingredient(id: 4, name: "Tomatensauce", unitId: 2, unit: Unit(id: 2, name: "ml"))),
                UsesIngredient(id: 5, amount: 125, ingredientId: 5, ingredient: Ingredient(id: 5, name: "Mozzarella", unitId: 1, unit: Unit(id: 1, name: "g")))
            ],
            hasSteps: [
                StepRelation(id: 3, stepId: 3, RecipeStep: RecipeStep(id: 3, title: "Teig zubereiten", description: "Hefe, Mehl und Wasser zu einem Teig kneten.", duration: 20)),
                StepRelation(id: 4, stepId: 4, RecipeStep: RecipeStep(id: 4, title: "Backen", description: "Pizza bei 250 °C ca. 10 Minuten backen.", duration: 10))
            ],
            hasTags: [
                TagRelation(id: 3, tagId: 3, Tag: Tag.vegetarian),
                TagRelation(id: 4, tagId: 4, Tag: Tag.italian)
            ]
        )
    }
    
    static var caesarSalad: Recipe {
        Recipe(
            id: 3,
            name: "Caesar Salad",
            imageUrl: "caesar",
            rating: 4.3,
            duration: 20,
            calories: 400,
            annotation: "Leichter Sommersalat",
            difficulty: "Einfach",
            categoryId: 3,
            category: Category(id: 3, name: "Salat"),
            usesIngredients: [
                UsesIngredient(id: 6, amount: 200, ingredientId: 6, ingredient: Ingredient(id: 6, name: "Römersalat", unitId: 1, unit: Unit(id: 1, name: "g"))),
                UsesIngredient(id: 7, amount: 50, ingredientId: 7, ingredient: Ingredient(id: 7, name: "Croutons", unitId: 1, unit: Unit(id: 1, name: "g"))),
                UsesIngredient(id: 8, amount: 30, ingredientId: 8, ingredient: Ingredient(id: 8, name: "Parmesan", unitId: 1, unit: Unit(id: 1, name: "g")))
            ],
            hasSteps: [
                StepRelation(id: 5, stepId: 5, RecipeStep: RecipeStep(id: 5, title: "Salat waschen", description: "Römersalat gründlich waschen und klein zupfen.", duration: 1)),
                StepRelation(id: 6, stepId: 6, RecipeStep: RecipeStep(id: 6, title: "Dressing hinzufügen", description: "Salat mit Caesar-Dressing vermengen.", duration: 2))
            ],
            hasTags: [
                TagRelation(id: 5, tagId: 5, Tag: Tag.classic),
                TagRelation(id: 6, tagId: 6, Tag: Tag.light)
            ]
        )
    }
    
    static var cheesecake: Recipe {
        Recipe(
            id: 4,
            name: "Käsekuchen",
            imageUrl: "cheesecake",
            rating: 4.9,
            duration: 90,
            calories: 1200,
            annotation: "Cremiger Klassiker",
            difficulty: "Schwer",
            categoryId: 4,
            category: Category(id: 4, name: "Dessert"),
            usesIngredients: [
                UsesIngredient(id: 9, amount: 500, ingredientId: 9, ingredient: Ingredient(id: 9, name: "Quark", unitId: 1, unit: Unit(id: 1, name: "g"))),
                UsesIngredient(id: 10, amount: 200, ingredientId: 10, ingredient: Ingredient(id: 10, name: "Zucker", unitId: 1, unit: Unit(id: 1, name: "g"))),
                UsesIngredient(id: 11, amount: 3, ingredientId: 11, ingredient: Ingredient(id: 11, name: "Eier", unitId: 3, unit: Unit(id: 3, name: "Stück")))
            ],
            hasSteps: [
                StepRelation(id: 7, stepId: 7, RecipeStep: RecipeStep(id: 7, title: "Teigboden vorbereiten", description: "Mürbeteig kneten und in Form drücken.", duration: 20)),
                StepRelation(id: 8, stepId: 8, RecipeStep: RecipeStep(id: 8, title: "Backen", description: "Bei 180 °C ca. 60 Minuten backen.", duration: 60))
            ],
            hasTags: [
                TagRelation(id: 7, tagId: 7, Tag: Tag.sweet),
                TagRelation(id: 8, tagId: 8, Tag: Tag.oven)
            ]
        )
    }
}

