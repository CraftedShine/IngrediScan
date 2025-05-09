//
//  YourIngredientList.swift
//  IngrediScan
//
//  Created by Faramir on 30.04.25.
//

import SwiftUI

struct YourIngredientList: View {
    @State private var ingredients: [Ingredient] = [
        Ingredient(name: "Wasser", amount: 500, unit: "ml"),
        Ingredient(name: "Olivenöl", amount: 25, unit: "ml"),
        Ingredient(name: "Frischhefe", amount: 40, unit: "g"),
        Ingredient(name: "Salz", amount: 20, unit: "g"),
        Ingredient(name: "Zucker", amount: 1, unit: "Prise")
    ]
    @State private var selectedIngredient: String = ""
    @State private var showingConfirmation: Bool = false
    @State private var showModal: Bool = false
    
    var body: some View {
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
    }
}

#Preview {
    YourIngredientList()
}
