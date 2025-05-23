//
//  Recipe.swift
//  IngrediScan
//
//  Created by Fynn Schotten on 25.04.25.
//

import Foundation
import SwiftUICore

enum Difficulty : String, Codable {
    case Easy = "Einfach"
    case Medium = "Mittel"
    case Hard = "Schwer"
}

struct Recipe : Identifiable, Codable, Hashable {
    var id: String
    
    var name: String
    var category: String
    var imageName: String
    var steps: [RecipeStep]
    var ingredients: [Ingredient]
    var workingTime: String
    var difficulty: Difficulty
    var calories: Int
    var rating: Double
    var tags: [String]
    
    var isFavorite: Bool = false
    
    private enum CodingKeys: String, CodingKey {
        case id, name, category, imageName, steps, ingredients, workingTime, difficulty, calories, rating, tags
    }
}
