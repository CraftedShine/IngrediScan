//
//  SearchForm.swift
//  IngrediScan
//
//  Created by Jan Keller on 14.06.25.
//

import SwiftUI

struct Search {
    let sortCategories: [String] = ["rating","duration","calories"]
    var selectedSortCategories: [String] = []
    let difficultyPicker: [String] = ["leicht","mittel","schwer"]
    var selectedDifficulty: [String] = []
    let ratingPicker: [Int] = [1,2,3,4,5]
    var selectedRating: Int = -1
    var searchWithFridge: Int = 0
}


struct SearchForm: View {
    
    var search: Search = Search()
    @Binding var searchResult: [Recipe]
    let recipeList: [Recipe]
    let fridge: MyFridge
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    func searchRecipes() {
        
        //filter by difficulty
        if !search.selectedDifficulty.isEmpty {
            searchResult = searchResult.filter { search.selectedDifficulty.contains($0.difficulty ?? "") }
        }
        
        //filter by rating
        if search.selectedRating > 0 {
            searchResult = searchResult.filter { Int(($0.rating ?? 0).rounded()) == search.selectedRating }
        }
        
        //filter/ sort by fridge
        if search.searchWithFridge == 0 {
            searchResult = searchResult.filter { recipe in
                fridge.ingredientsMissing(recipe: recipe) == 0
            }
        } else if search.searchWithFridge == 2 {
            searchResult = searchResult.sorted {
                fridge.ingredientsMissing(recipe: $0) < fridge.ingredientsMissing(recipe: $1)
            }
        }

        
        //sort the result
        let sortByRating = search.selectedSortCategories.contains("rating") ? 1 : 0
        let sortByCalories = search.selectedSortCategories.contains("calories") ? 1 : 0
        let sortByDuration = search.selectedSortCategories.contains("duration") ? 1 : 0
        
        searchResult = searchResult.sorted {
            let rating1 = ($0.rating ?? 0) * Float(sortByRating) * 200
            let calories1 = Float($0.calories ?? 0) * Float(sortByCalories)
            let duration1 = Float($0.duration ?? 0) * Float(sortByDuration) * 10
            let score1 = rating1 - calories1 + duration1

            let rating2 = ($1.rating ?? 0) * Float(sortByRating) * 200
            let calories2 = Float($1.calories ?? 0) * Float(sortByCalories)
            let duration2 = Float($1.duration ?? 0) * Float(sortByDuration) * 10
            let score2 = rating2 - calories2 + duration2

            return score1 > score2
        }
        
        if search.searchWithFridge == 1 {
            searchResult = searchResult.sorted {
                fridge.ingredientsMissing(recipe: $0) < fridge.ingredientsMissing(recipe: $1)
            }
        }
    }
}

#Preview {
    @Previewable @State var searchResult: [Recipe] = []
    SearchForm(searchResult: $searchResult, recipeList: ViewModel().recipes, fridge: MockFridge())
}
