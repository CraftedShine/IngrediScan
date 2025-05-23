//
//  Ingredient.swift
//  IngrediScan
//
//  Created by Faramir on 26.04.25.
//

import Foundation

struct Ingredient : Identifiable, Codable, Hashable {
    var name: String
    var amount: Double
    var unit: String
    
    var id: String
}

