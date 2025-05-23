//
//  Category.swift
//  IngrediScan
//
//  Created by Faramir on 07.05.25.
//

import Foundation

struct Category : Identifiable, Codable {
    var id: UUID = UUID()
    
    var name: String
}
