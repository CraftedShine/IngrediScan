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
    let imageUrl: String
    let rating: Float
    let duration: Int
    let calories: Int
    let annotation: String?
    let difficulty: String
    let categoryId: Int
    
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
    let id: Int
    let name: String
}

struct UsesIngredient: Decodable, Hashable, Identifiable {
    let id: Int
    let amount: Float
    let ingredientId: Int
    let ingredient: Ingredient
    
    enum CodingKeys: String, CodingKey {
        case id
        case amount
        case ingredientId
        case ingredient
    }
}

struct Ingredient: Decodable, Hashable, Identifiable {
    let id: Int
    let name: String
    let unitId: Int
    let icon: String?
    let unit: Unit
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case unitId
        case icon
        case unit
    }
}

struct Unit: Codable, Hashable {
    let id: Int
    let name: String
}

struct StepRelation: Codable {
    let id: Int
    let stepId: Int
    var RecipeStep: RecipeStep
}

struct RecipeStep: Codable, Hashable, Identifiable {
    let id: Int
    let title: String
    let description: String?
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
