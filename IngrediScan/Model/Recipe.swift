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
    
    public init(name: String, category: String, image: String, ingredients: [Ingredient]) {
        self.name = name
        self.category = category
        self.image = image
        self.ingredients = ingredients
    }
}
