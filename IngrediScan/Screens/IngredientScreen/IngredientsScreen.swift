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
            YourIngredientList()
        }
    }
}

#Preview {
    IngredientsScreen()
}
