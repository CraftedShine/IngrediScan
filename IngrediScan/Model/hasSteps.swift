//
//  hasSteps.swift
//  IngrediScan
//
//  Created by Faramir on 26.05.25.
//

import Foundation

struct hasSteps: Decodable, Identifiable, Hashable {
    let id: Int
    let recipe: Int
    let step: Int
}
