//
//  RecipeStatistics.swift
//  IngrediScan
//
//  Created by Faramir on 07.05.25.
//

import Foundation

class RecipeStatistic : Identifiable {
    let id: UUID = UUID()
    
    let name: String
    let description: String
    
    init(name: String, description: String) {
        self.name = name
        self.description = description
    }
}
