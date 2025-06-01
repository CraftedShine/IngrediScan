//
//  Ingredient.swift
//  IngrediScan
//
//  Created by Faramir on 26.04.25.
//

import Foundation

struct Ingredient : Identifiable, Decodable, Hashable {
    let id: Int
    var name: String
    var unit: Unit
    
    var amount: Double = 0
    
    private enum CodingKeys: String, CodingKey {
        case id, name, unit
    }
}

