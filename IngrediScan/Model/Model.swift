//
//  Model.swift
//  IngrediScan
//
//  Created by Faramir on 06.06.25.
//

import Foundation

struct Recipe: Codable, Identifiable {
    let id: String
    var name: String
    let imageUrl: String
    let rating: Float
    let duration: Int
    let calories: Int
    let annotation: String
    let difficulty: String
    let categoryId: String
    
    var category: Category
    var usesIngredients: [UsesIngredient]
    var hasSteps: [StepRelation]
    var hasTags: [TagRelation]
    var isFavorite: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case id, name, rating, duration, calories, annotation, difficulty
        case imageUrl
        case categoryId
        case category
        case usesIngredients
        case hasSteps
        case hasTags
    }
    
}

struct Category: Codable, Identifiable {
    let id: String
    let name: String
}

struct UsesIngredient: Codable, Hashable, Identifiable {
    let id: String
    let amount: Float
    let ingredientId: String
    let ingredient: Ingredient
    
    enum CodingKeys: String, CodingKey {
        case id
        case amount
        case ingredientId
        case ingredient
    }
}

struct Ingredient: Codable, Hashable, Identifiable {
    let id: String
    let name: String
    var unitId: String
    var unit: Unit
}

struct Unit: Codable, Hashable {
    let id: String
    let name: String
}

struct StepRelation: Codable {
    let id: String
    let stepId: String
    var RecipeStep: RecipeStep
}

struct RecipeStep: Codable, Hashable, Identifiable {
    let id: String
    let title: String
    let description: String
    var duration: Int
    
    var isCompleted: Bool = false
    
    enum CodingKeys: CodingKey {
        case id
        case title
        case description
        case duration
    }
}

struct TagRelation: Codable, Hashable {
    let id: String
    let tagId: String
    let Tag: Tag
}

struct Tag: Codable, Hashable {
    let id: String
    let name: String
    
    var isSelected: Bool = false
    
    enum CodingKeys: CodingKey {
        case id
        case name
    }
}
