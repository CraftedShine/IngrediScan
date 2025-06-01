//
//  CookingStep.swift
//  IngrediScan
//
//  Created by Faramir on 07.05.25.
//

import Foundation

struct RecipeStep : Identifiable, Decodable, Hashable {
    let id: Int
    
    let title : String
    let description : String?
    let duration: Int
    
    var isDone : Bool = false
    
    private enum CodingKeys: String, CodingKey {
        case id, title, description, duration
    }
}
