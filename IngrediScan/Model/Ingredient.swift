//
//  Ingredient.swift
//  IngrediScan
//
//  Created by Faramir on 26.04.25.
//

import Foundation

struct Ingredient : Identifiable {
    var name: String
    var amount: Double
    var unit: String
    
    let id = UUID()
}
