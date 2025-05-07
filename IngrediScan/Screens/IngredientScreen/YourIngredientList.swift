//
//  YourIngredientList.swift
//  IngrediScan
//
//  Created by Faramir on 30.04.25.
//

import SwiftUI

struct YourIngredientList: View {
    @State private var ingredients: [Ingredient] = [
        Ingredient(name: "Wasser", amount: 500, unit: "ml", category: "Wasser"),
        Ingredient(name: "Olivenöl", amount: 25, unit: "ml", category: "Öl"),
        Ingredient(name: "Frischhefe", amount: 40, unit: "g", category: "Backwaren"),
        Ingredient(name: "Salz", amount: 20, unit: "g", category: "Gewürze"),
        Ingredient(name: "Zucker", amount: 1, unit: "Prise", category: "Gewürze")
    ]
    @State private var selectedIngredient: String = ""
    @State private var showingConfirmation: Bool = false
    @State private var showModal: Bool = false
    
    var body: some View {
        GeometryReader { g in
            VStack(alignment: .leading) {
                Text("Search for Ingredients to add to List")
                    .font(.callout .bold() .smallCaps())
                    .foregroundStyle(.gray)
                    .padding(.leading)
                List {
                    Section(header: IngredientListHeader()) {
                        ForEach(ingredients) { ingredient in
                            HStack {
                                Text(ingredient.name)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text("\(String(ingredient.amount)) \(String(ingredient.unit))")
                                    .frame(width: .infinity, alignment: .trailing)
                            }
                        }
                    }
                }
                .listStyle(.plain)
                .frame(width: .infinity, height: g.size.height * 0.5)
                .navigationTitle("Your Ingredients")
                .searchable(text: $selectedIngredient)
                .onSubmit(of: .search) {
                    showModal = true
                }
                
                // Clear list Button
                Button {
                    showingConfirmation = true
                } label: {
                    Label("Clear List", systemImage: "trash")
                        .foregroundStyle(.red)
                }
                .confirmationDialog("Clear List?", isPresented: $showingConfirmation, titleVisibility: .visible) {
                            Button(role: .destructive) {
                                ingredients.removeAll()
                            } label: {
                                Label("Clear", systemImage: "trash")
                            }

                            Button("Cancel", role: .cancel) { }
                        }
                .frame(width: g.size.width, alignment: .center)
                .padding(.top)
            }
        }
    }
}

#Preview {
    YourIngredientList()
}
