//
//  SearchScreen.swift
//  IngrediScan
//
//  Created by Jan Keller on 14.05.25.
//

import SwiftUI

struct SearchScreen: View {
    @State private var isSearching: Bool = false
    @State private var searchOnlyWithAvailableIngredients: Bool = true
    @State private var selectedFilters: Set<String> = []
    @State private var selectedIngredients: Set<String> = ["Tomate", "Zwiebel", "Rinderhackfleisch", "Käse", "Salz & Pfeffer", "Olivenöl", "Knoblauch", "Paprika", "Mehl", "Milch"]
    
    let ingredientOptions = ["Tomate", "Zwiebel", "Rinderhackfleisch", "Käse", "Salz & Pfeffer", "Olivenöl", "Knoblauch", "Paprika", "Mehl", "Milch"]

    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    VStack(spacing: 20) {
                        Text("Ingredient Search")
                            .font(.largeTitle)
                            .bold()
                            .padding(.top, 20)
                        
                        Divider()

                        FilterOptionsView(selectedFilters: $selectedFilters)

                        Divider()

                        IngredientSearchPickerView(searchOnlyWithAvailableIngredients: $searchOnlyWithAvailableIngredients)

                        if searchOnlyWithAvailableIngredients {
                            Divider()
                            IngredientSelectionView(selectedIngredients: $selectedIngredients, ingredientOptions: ingredientOptions)
                        }
                    }
                    .padding()
                }
                
                // Floating Search Button mit NavigationLink
                VStack {
                    Spacer()
                    NavigationLink(destination: SearchResultsScreen(), isActive: $isSearching) { EmptyView() }
                    Button(action: {
                        isSearching = true
                    }) {
                        Text("Search")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 30)
                            .padding(.horizontal, 40)
                    }
                    .padding(.bottom, 20)
                }
            }
        }
    }
}

#Preview {
    SearchScreen()
}
