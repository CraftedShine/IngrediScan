//
//  SearchForm.swift
//  IngrediScan
//
//  Created by Jan Keller on 14.06.25.
//

import SwiftUI


struct SearchForm: View {
    
    @State private var search: Search = Search()
    @Binding var searchResult: [Recipe]
    let recipeList: [Recipe]
    let fridge: MyFridge
    var onButtonPress: () -> Void
    
    var body: some View {
        VStack{
            Text("Rezepte sortieren nach...")
                .font(.headline .bold() .smallCaps())
                .padding(.top)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 12), count: 2), spacing: 12) {
                ForEach(search.sortCategories, id: \.self) { option in
                    Button(action: {
                        if search.selectedSortCategories.contains(option) {
                            search.selectedSortCategories.removeAll { $0 == option }
                        } else {
                            search.selectedSortCategories.append(option)
                        }
                    }) {
                        Text(option)
                            .foregroundColor(.orange)
                            .font(.headline .bold() .smallCaps())
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(search.selectedSortCategories.contains(option) ? Color.orange.opacity(0.1) : Color(.systemGray6))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(search.selectedSortCategories.contains(option) ? Color.orange : Color.clear, lineWidth: 2)
                            )
                            .cornerRadius(10)
                    }
                }
            }
            .padding(.init(top: 20, leading: 0, bottom: 0, trailing: 0))
            
            Divider()
            
            Text("Rezepte filtern nach...")
                .font(.headline .bold() .smallCaps())
                .padding(.init(top: 40, leading: 0, bottom: 20, trailing: 0))
            
            HStack {
                Text("Bewertung")
                Spacer()
                StarRatingView(rating: $search.selectedRating)
            }
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 12), count: 3), spacing: 12) {
                ForEach(search.difficultyPicker, id: \.self) { difficulty in
                    Button(action: {
                        if search.selectedDifficulty.contains(difficulty) {
                            search.selectedDifficulty.removeAll { $0 == difficulty }
                        } else {
                            search.selectedDifficulty.append(difficulty)
                        }
                    }) {
                        Text(difficulty)
                            .foregroundColor(.orange)
                            .font(.headline .bold() .smallCaps())
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(search.selectedDifficulty.contains(difficulty) ? Color.orange.opacity(0.1) : Color(.systemGray6))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(search.selectedDifficulty.contains(difficulty) ? Color.orange : Color.clear, lineWidth: 2)
                            )
                            .cornerRadius(10)
                    }
                }
            }
            .padding(.init(top: 20, leading: 0, bottom: 0, trailing: 0))
            
            Divider()
            
            Text("Suchen mit Kühlschrank")
                .font(.headline .bold() .smallCaps())
                .padding(.init(top: 40, leading: 0, bottom: 0, trailing: 0))
            
            Picker("", selection: $search.searchWithFridge) {
                Text("Nur mit vorhandenen Zutaten").tag(0)
                Text("Auch mit fehlenden Zutaten").tag(1)
                Text("Kühlschrank ignorieren").tag(2)
            }
            .pickerStyle(MenuPickerStyle())
            .tint(.black)
            
            Button(action: {
                searchRecipes()
                onButtonPress()
            }) {
                Text("Show Recipes")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.init(top: 40, leading: 20, bottom: 20, trailing: 20))

        }
        .padding()
    }
    
    func searchRecipes() {
        
        searchResult = recipeList
        
        //filter by difficulty
        if !search.selectedDifficulty.isEmpty {
            searchResult = searchResult.filter { search.selectedDifficulty.contains($0.difficulty) }
        }
        
        //filter by rating
        if search.selectedRating > 0 {
            searchResult = searchResult.filter { Int($0.rating.rounded()) == search.selectedRating }
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
        let sortByRating = search.selectedSortCategories.contains("Bewertung") ? 1 : 0
        let sortByCalories = search.selectedSortCategories.contains("Kalorien") ? 1 : 0
        let sortByDuration = search.selectedSortCategories.contains("Kochzeit") ? 1 : 0
        
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
        
        if search.searchWithFridge == 1 {
            searchResult = searchResult.sorted {
                fridge.ingredientsMissing(recipe: $0) < fridge.ingredientsMissing(recipe: $1)
            }
        }
    }
}

#Preview {
    @Previewable @State var searchResult: [Recipe] = []
    SearchForm(searchResult: $searchResult, recipeList: ViewModel().recipes, fridge: MockFridge(), onButtonPress: {})
}
