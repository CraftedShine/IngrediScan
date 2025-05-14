//
//  CookingStep.swift
//  IngrediScan
//
//  Created by Faramir on 07.05.25.
//

import Foundation

struct RecipeStep : Identifiable, Codable {
    var id: String?
    
    let title : String
    let description : String
    let duration: String
    let requiredIngredients : [Ingredient]
    
    var isDone : Bool = false
    
    private enum CodingKeys: String, CodingKey {
        case title, description, duration, requiredIngredients
    }
    
    public init(title : String, description : String, duration: String, requiredIngredients: [Ingredient]) {
        self.id = UUID().uuidString
        self.title = title
        self.description = description
        self.duration = duration
        self.requiredIngredients = requiredIngredients
        self.isDone = false
    }
}
