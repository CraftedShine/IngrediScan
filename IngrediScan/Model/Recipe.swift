//
//  Recipe.swift
//  IngrediScan
//
//  Created by Fynn Schotten on 25.04.25.
//

import Foundation

class Recipe : Identifiable
{
    let id = UUID()
    
    var name: String
    var category: String
    var image: String
    var ingredients: [Ingredient]
    var workingTime: String
    var difficulty: String
    var calories: String
    
    public init(name: String, category: String, image: String, workingTime: String, difficulty: String, calories: String, ingredients: [Ingredient]) {
        self.name = name
        self.category = category
        self.image = image
        self.workingTime = workingTime
        self.difficulty = difficulty
        self.calories = calories
        self.ingredients = ingredients
    }
}
