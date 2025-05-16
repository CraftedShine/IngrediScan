//
//  SearchModel.swift
//  IngrediScan
//
//  Created by Jan Keller on 15.05.25.
//

import Foundation

class SearchModel: ObservableObject {
    @Published var cookTimeImportance: Double
    @Published var difficultyImportance: Double
    @Published var caloriesImportance: Double
    @Published var ingredientsCountImportance: Double

    init(cookTimeImportance: Double = 0.5, difficultyImportance: Double = 0.5, caloriesImportance: Double = 0.5, ingredientsCountImportance: Double = 0.5) {
        self.cookTimeImportance = cookTimeImportance
        self.difficultyImportance = difficultyImportance
        self.caloriesImportance = caloriesImportance
        self.ingredientsCountImportance = ingredientsCountImportance
    }
}

