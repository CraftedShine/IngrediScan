//
//  Model.swift
//  IngrediScan
//
//  Created by Faramir on 06.06.25.
//

import Foundation

struct Recipe: Decodable, Identifiable {
    let id: Int
    var name: String
    let imageUrl: String?
    let rating: Float?
    let duration: Int?
    let calories: Int?
    let annotation: String?
    let difficulty: String?
    let categoryId: Int?
    
    var category: Category?
    var usesIngredients: [UsesIngredient]?
    var hasSteps: [StepRelation]?
    var hasTags: [TagRelation]?
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
    let id: Int
    let name: String
}

struct UsesIngredient: Codable, Hashable, Identifiable {
    let id: Int
    let amount: Float
    let ingredientId: Int
    let ingredient: Ingredient
    let unitId: Int
    let unit: Unit
    
    enum CodingKeys: String, CodingKey {
        case id
        case amount
        case ingredientId
        case ingredient
        case unitId
        case unit
    }
}

struct Ingredient: Codable, Hashable, Identifiable {
    let id: Int
    let name: String
}

struct Unit: Codable, Hashable {
    let id: Int
    let name: String
}

struct StepRelation: Codable {
    let id: Int
    let stepId: Int
    let RecipeStep: RecipeStep
}

struct RecipeStep: Codable {
    let id: Int
    let title: String
    let description: String?
    let duration: Int?
}

struct TagRelation: Codable, Hashable {
    let id: Int
    let tagId: Int
    let Tag: Tag
}

struct Tag: Codable, Hashable {
    let id: Int
    let name: String
    
    var isSelected: Bool = false
    
    enum CodingKeys: CodingKey {
        case id
        case name
    }
}
