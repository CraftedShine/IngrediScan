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
    
    let filterOptions = ["Kochzeit", "Schwierigkeit", "Kalorien", "Zutatenanzahl"]
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

                        // Filter-Kategorien
                        VStack(spacing: 15) {
                            Text("Sortieren nach")
                                .font(.headline)

                            ForEach(filterOptions, id: \.self) { option in
                                Button(action: {
                                    if selectedFilters.contains(option) {
                                        selectedFilters.remove(option)
                                    } else {
                                        selectedFilters.insert(option)
                                    }
                                }) {
                                    HStack {
                                        Text(option)
                                            .font(.body)
                                            .foregroundColor(.primary)
                                        Spacer()
                                        Image(systemName: selectedFilters.contains(option) ? "checkmark.circle.fill" : "circle")
                                            .foregroundColor(selectedFilters.contains(option) ? .blue : .gray)
                                    }
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 2))
                                }
                            }
                        }
                        .padding(.horizontal, 20)

                        Divider()

                        // Zutaten-Filter
                        VStack(spacing: 10) {
                            Text("Zutaten-Auswahl:")
                                .font(.headline)
                            
                            Picker("Suchmodus", selection: $searchOnlyWithAvailableIngredients) {
                                Text("Nur vorhandene Zutaten").tag(true)
                                Text("Rezepte mit fehlenden Zutaten").tag(false)
                            }
                            .pickerStyle(SegmentedPickerStyle())
                        }
                        .padding()

                        if searchOnlyWithAvailableIngredients {
                            Divider()
                            VStack(spacing: 15) {
                                Text("Zutaten auswählen")
                                    .font(.headline)

                                ForEach(ingredientOptions, id: \.self) { ingredient in
                                    Button(action: {
                                        if selectedIngredients.contains(ingredient) {
                                            selectedIngredients.remove(ingredient)
                                        } else {
                                            selectedIngredients.insert(ingredient)
                                        }
                                    }) {
                                        HStack {
                                            Text(ingredient)
                                                .font(.body)
                                                .foregroundColor(.primary)
                                            Spacer()
                                            Image(systemName: selectedIngredients.contains(ingredient) ? "checkmark.circle.fill" : "circle")
                                                .foregroundColor(selectedIngredients.contains(ingredient) ? .blue : .gray)
                                        }
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 2))
                                    }
                                }
                                Spacer().frame(height: 80)
                            }
                            .padding(.horizontal, 20)
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

