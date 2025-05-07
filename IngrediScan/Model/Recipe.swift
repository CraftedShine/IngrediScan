//
//  Recipe.swift
//  IngrediScan
//
//  Created by Fynn Schotten on 25.04.25.
//

import Foundation

enum Difficulty : String {
    case Easy = "Einfach"
    case Medium = "Mittel"
    case Hard = "Schwer"
}

class Recipe : Identifiable
{
    let id = UUID()
    
    var name: String
    var category: Category
    var image: String
    var steps: [RecipeStep]
    var ingredients: [Ingredient]
    var workingTime: String
    var difficulty: Difficulty
    var calories: Int
    var rating: Double
    var tags: [String]
    
    public init(name: String, category: Category, image: String, steps: [RecipeStep], ingredients: [Ingredient], workingTime: String, difficulty: Difficulty, calories: Int, rating: Double, tags: [String]) {
        self.name = name
        self.category = category
        self.image = image
        self.steps = steps
        self.ingredients = ingredients
        self.workingTime = workingTime
        self.difficulty = difficulty
        self.calories = calories
        self.rating = rating
        self.tags = tags
    }
}
