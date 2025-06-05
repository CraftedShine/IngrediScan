//
//  Tag.swift
//  IngrediScan
//
//  Created by Faramir on 26.05.25.
//

import Foundation

struct Tag: Identifiable, Decodable, Hashable {
    let id: Int
    var name: String
    
    var isSelected: Bool = false
    
    private enum CodingKeys: String, CodingKey {
        case id, name
    }
}
