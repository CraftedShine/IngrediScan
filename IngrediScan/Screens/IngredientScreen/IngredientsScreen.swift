//
//  IngredientsScreen.swift
//  IngrediScan
//
//  Created by Faramir on 25.04.25.
//

import SwiftUI

struct IngredientsScreen: View {
    @State var ingredients: [Ingredient] = [
        Ingredient(name: "Tomaten", amount: 2, unit: "Stk"),
        Ingredient(name: "Zwiebeln", amount: 3, unit: "Stk"),
        Ingredient(name: "Eier", amount: 5, unit: "Stk"),
        Ingredient(name: "Käse", amount: 2, unit: "Scheiben"),
        Ingredient(name: "Mehl", amount: 500, unit: "g")
    ]
    @State private var selectedIngredient: String = ""

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                List {
                    // Tabellenkopf
                    HStack {
                        Text("Ingredient")
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("Amount")
                            .bold()
                            .frame(width: .infinity, alignment: .trailing)
                    }
                    
                    ForEach(ingredients) { ingredient in
                        HStack {
                            Text(ingredient.name)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("\(String(ingredient.amount)) \(String(ingredient.unit))")
                                .frame(width: .infinity, alignment: .trailing)
                        }
                    }
                }
                .navigationTitle("Your Ingredients")
                .searchable(text: $selectedIngredient)
                .onSubmit(of: .search) {
                    ingredients.append(Ingredient(name: selectedIngredient, amount: 1, unit: "Stk"))
                }
            }
        }
    }
}

#Preview {
    IngredientsScreen()
}
