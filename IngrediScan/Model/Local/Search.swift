//
//  Search.swift
//  IngrediScan
//
//  Created by Jan Keller on 14.06.25.
//

struct Search {
    let sortCategories: [String] = ["Kalorien","Bewertung","Kochzeit"]
    var selectedSortCategories: [String] = []
    let difficultyPicker: [String] = ["Einfach","Mittel","Schwierig"]
    var selectedDifficulty: [String] = []
    var selectedRating: Int = -1
    var searchWithFridge: Int = 0
}
