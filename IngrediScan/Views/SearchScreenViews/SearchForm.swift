//
//  SearchForm.swift
//  IngrediScan
//
//  Created by Jan Keller on 14.06.25.
//

import SwiftUI

fileprivate struct FilterOptions: View {
    @EnvironmentObject var search: SearchViewModel
    
    var body: some View {
        Text("Rezepte filtern nach")
            .font(.headline .bold() .smallCaps())
        
        HStack {
            Text("Bewertung")
                .font(.subheadline .bold() .smallCaps())
            Spacer()
            StarRatingView(rating: $search.selectedRating)
        }
        
        HStack {
            ForEach(search.difficultyPicker, id: \.self) { difficulty in
                let isSelected = search.selectedDifficulty.contains(difficulty)
                let buttonBackground = isSelected ? Color.orange.opacity(0.1) : Color(.systemGray6)
                let borderColor = isSelected ? Color.orange : Color.clear
                
                
                RoundedRectangularButton(
                    title: difficulty,
                    color: .orange,
                    backgroundColor: buttonBackground,
                    borderColor: borderColor,
                    cornerRadius: 10
                ) {
                    if isSelected {
                        search.selectedDifficulty.removeAll { $0 == difficulty }
                    } else {
                        search.selectedDifficulty.append(difficulty)
                    }
                }
            }
        }
        .frame(width: .infinity)
    }
}

fileprivate struct SortOptions: View {
    @EnvironmentObject var search: SearchViewModel
    private let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        Text("Rezepte sortieren nach")
            .font(.headline .bold() .smallCaps())
        
        LazyVGrid(columns: self.columns) {
            ForEach(search.sortCategories, id: \.self) { option in
                let isSelected = search.selectedSortCategories.contains(option)
                let buttonBackground = isSelected ? Color.orange.opacity(0.1) : Color(.systemGray6)
                let borderColor = isSelected ? Color.orange : Color.clear
                
                RoundedRectangularButton(
                    title: option,
                    color: .orange,
                    backgroundColor: buttonBackground,
                    borderColor: borderColor,
                    cornerRadius: 10
                ) {
                    if isSelected {
                        search.selectedSortCategories.removeAll { $0 == option }
                    } else {
                        search.selectedSortCategories.append(option)
                    }
                }
            }
        }
        .frame(width: .infinity)
    }
}

fileprivate struct IngredientOptions: View {
    @EnvironmentObject var search: SearchViewModel
    
    var searchWithFridge: Bool {
        search.searchWithFridge
    }
    
    var searchWithIngredients: Bool {
        search.searchWithIngredients
    }
    
    var body: some View {
        VStack {
            //MARK: Ignore Fridge
            HStack {
                Text("Kühlschrank ignorieren")
                    .font(.subheadline .bold() .smallCaps())
                Spacer()
                Button {
                    search.searchWithFridge.toggle()
                } label: {
                    Image(systemName: !searchWithFridge ? "checkmark.square.fill" : "square")
                        .scaleEffect(1.5)
                        .foregroundColor(.orange)
                }
            }
            .padding(.bottom)
            
            //MARK: Ingredient Options
            if searchWithFridge {
                Text("Suchen mit Zutaten")
                    .font(.headline .bold() .smallCaps())
                
                HStack {
                    RoundedRectangularButton(
                        title: "Nur Vorhanden",
                        color: .orange,
                        backgroundColor: searchWithIngredients ? .orange.opacity(0.1) : Color(.systemGray6),
                        borderColor: searchWithIngredients ? .orange : .clear
                    ) {
                        search.searchWithIngredients = true
                    }
                    
                    RoundedRectangularButton(
                        title: "Alle Zutaten",
                        color: .orange,
                        backgroundColor: !searchWithIngredients ? .orange.opacity(0.1) : Color(.systemGray6),
                        borderColor: !searchWithIngredients ? .orange : .clear
                    ) {
                        search.searchWithIngredients = false
                    }
                }
                .frame(width: .infinity)
            }
        }
    }
}

struct SearchForm: View {
    @EnvironmentObject var viewModel: ViewModel
    @EnvironmentObject private var search: SearchViewModel
    @Environment(\.dismiss) private var dismiss
    
    var onButtonPress: () -> Void
    
    var body: some View {
        NavigationView {
            VStack {
                IngredientOptions()
                    .padding()
                
                Divider()
                    .padding(.horizontal)
                
                SortOptions()
                    .padding()
                
                Divider()
                    .padding(.horizontal)
                
                FilterOptions()
                    .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    CircularButton(
                        size: 20,
                        padding: 10,
                        color: .black.opacity(0.8),
                        image: "xmark"
                    ) {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .principal) {
                    TextField("Suchen nach Text...", text: $search.searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                ToolbarItem(placement: .confirmationAction) {
                    CircularButton(size: 20, padding: 10, color: .orange, image: "magnifyingglass") {
                        search.searchRecipes(recipes: viewModel.recipes, fridge: viewModel.fridge)
                        onButtonPress()
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    SearchForm(onButtonPress: {})
        .withPreviewEnvironmentObjects()
}
