//
//  FridgeItem.swift
//  IngrediScan
//
//  Created by Jan Keller on 26.06.25.
//

import Foundation

struct FridgeItem: Identifiable, Codable, Hashable {
    var id = UUID()
    var ingredientId: Int
    var amount: Float
}
