//
//  Search.swift
//  IngrediScan
//
//  Created by Jan Keller on 14.06.25.
//

import Foundation
import SwiftUI

class SearchViewModel: ObservableObject {
    var fridge: FridgeViewModel?
    
    let sortCategories: [String] = ["Kalorien","Bewertung","Kochzeit"]
    let difficultyPicker: [String] = ["Einfach","Mittel","Schwierig"]
    
    @Published var searchResult: [Recipe] = []
    
    @Published var selectedDifficulty: [String] = []
    @Published var selectedSortCategories: [String] = []
    @Published var selectedRating: Int = -1
    @Published var searchWithFridge: Bool = true
    @Published var searchWithIngredients: Bool = true
    @Published var searchText: String = ""
    
    func searchRecipes(recipes: [Recipe]) {
        
        searchResult = recipes
        
        //filter by difficulty
        if !selectedDifficulty.isEmpty {
            searchResult = searchResult.filter { selectedDifficulty.contains($0.difficulty) }
        }
        
        //filter by rating
        if selectedRating > 0 {
            searchResult = searchResult.filter { Int($0.rating.rounded()) == selectedRating }
        }
        
        //filter/ sort by fridge
        if searchWithFridge && searchWithIngredients {
            searchResult = searchResult.filter { recipe in
                    fridge!.ingredientsMissing(recipe: recipe) == 0
            }
        }
        
        //sort the result
        let sortByRating = selectedSortCategories.contains("Bewertung") ? 1 : 0
        let sortByCalories = selectedSortCategories.contains("Kalorien") ? 1 : 0
        let sortByDuration = selectedSortCategories.contains("Kochzeit") ? 1 : 0
        
        searchResult = searchResult.sorted {
            let rating1 = ($0.rating) * Float(sortByRating) * 200
            let calories1 = Float($0.calories) * Float(sortByCalories)
            let duration1 = Float($0.duration) * Float(sortByDuration) * 10
            let score1 = rating1 - calories1 - duration1
            
            let rating2 = ($1.rating) * Float(sortByRating) * 200
            let calories2 = Float($1.calories) * Float(sortByCalories)
            let duration2 = Float($1.duration) * Float(sortByDuration) * 10
            let score2 = rating2 - calories2 - duration2
            
            return score1 > score2
        }
        
        if searchWithFridge && !searchWithIngredients {
            searchResult = searchResult.sorted {
                fridge!.ingredientsMissing(recipe: $0) < fridge!.ingredientsMissing(recipe: $1)
            }
        }
        
        if !searchText.isEmpty {
            searchResult = searchResult.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
}
