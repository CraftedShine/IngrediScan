//
//  Ingredient.swift
//  IngrediScan
//
//  Created by Faramir on 26.04.25.
//

import Foundation

class Ingredient: Identifiable {
    var id = UUID()
    var name: String
    var amount: Double
    var unit: String
    
    init(name: String, amount: Double, unit: String) {
        self.name = name
        self.amount = amount
        self.unit = unit
    }
}

