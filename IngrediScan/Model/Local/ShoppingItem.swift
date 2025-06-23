//
//  ShoppingItem.swift
//  IngrediScan
//
//  Created by Faramir on 22.06.25.
//

import Foundation

struct ShoppingItem: Identifiable, Codable {
    var id = UUID()
    var ingredientId: Int
    var amount: Int
    var isBought: Bool = false
}
