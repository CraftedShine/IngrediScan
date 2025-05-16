//
//  Category.swift
//  IngrediScan
//
//  Created by Faramir on 07.05.25.
//

import Foundation

class Category : Identifiable, Codable {
    var id: UUID = UUID()
    
    var name: String
    var image: String
    
    public init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
