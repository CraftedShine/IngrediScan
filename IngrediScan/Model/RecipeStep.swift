//
//  CookingStep.swift
//  IngrediScan
//
//  Created by Faramir on 07.05.25.
//

import Foundation

struct RecipeStep : Identifiable {
    var id: UUID = UUID()
    
    let title : String
    let description : String
    let duration: String
    let requiredIngredients : [Ingredient]
    
    var isDone : Bool
    
    public init(title : String, description : String, duration: String, requiredIngredients: [Ingredient]) {
        self.title = title
        self.description = description
        self.duration = duration
        self.requiredIngredients = requiredIngredients
        self.isDone = false
    }
}
