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
    var selectedRating: [Int] = []
    var searchWithFridge: Bool = true
}


struct SearchForm: View {
    
    var search: Search = Search()
    @Binding var searchResult: [Recipe]
    let recipeList: [Recipe]
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    func searchRecipes() {
        let sortByRating = search.selectedSortCategories.contains("rating") ? 1 : 0
        let sortByCalories = search.selectedSortCategories.contains("calories") ? 1 : 0
        let sortByDuration = search.selectedSortCategories.contains("duration") ? 1 : 0

    }
    /*
     let sortedList = recipes.sorted {
         ($0.rating * 0.5 + $0.popularity * 0.5) > ($1.rating * 0.5 + $1.popularity * 0.5)
     }
     */
}

#Preview {
    @Previewable @State var searchResult: [Recipe] = []
    SearchForm(searchResult: $searchResult, recipeList: ViewModel().recipes)
}
