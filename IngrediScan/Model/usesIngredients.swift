//
//  usesIngredients.swift
//  IngrediScan
//
//  Created by Faramir on 26.05.25.
//

import Foundation

struct usesIngredients: Decodable, Hashable, Identifiable {
    let id: Int
    let recipe: Int
    let ingredient: Int
    let amount: Float
}
