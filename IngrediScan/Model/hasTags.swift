//
//  hasTags.swift
//  IngrediScan
//
//  Created by Faramir on 26.05.25.
//

import Foundation

struct hasTags: Decodable, Hashable, Identifiable {
    let id: Int
    let recipe: Int
    let tag: Int
}
