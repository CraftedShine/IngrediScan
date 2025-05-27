//
//  Recipe.swift
//  IngrediScan
//
//  Created by Fynn Schotten on 25.04.25.
//

import Foundation
import SwiftUICore

enum Difficulty : String, Decodable, Hashable {
    case Easy = "Einfach"
    case Medium = "Mittel"
    case Hard = "Schwer"
}

struct Recipe : Identifiable, Decodable, Hashable {
    let id: Int
    
    var name: String
    var category: Category
    var imageUrl: String
    var workingTime: String
    var difficulty: Difficulty
    var calories: Int
    var rating: Double
    var tags: [String]
    var annotation: String?
    
    var steps: [RecipeStep] = []
    var ingredients: [Ingredient] = []
    var isFavorite: Bool = false
    
    private enum CodingKeys: String, CodingKey {
        case id, name, category, imageUrl, workingTime, difficulty, calories, rating, tags, annotation
    }
}
