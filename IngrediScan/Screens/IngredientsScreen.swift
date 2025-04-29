//
//  IngredientsScreen.swift
//  IngrediScan
//
//  Created by Faramir on 25.04.25.
//

import SwiftUI

struct IngredientsScreen: View {
    var ingredients = ["tomatoes", "onions", "noodles"]
    @State private var selectedIngredient: String = "Select Ingredient"

    var body: some View {
        VStack {
            Menu(selectedIngredient) {
                ForEach(ingredients, id: \.self) { ingredient in
                    Button(ingredient, action: {
                        selectedIngredient = ingredient
                    })
                }
            }

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background(Color(UIColor.lightGray).opacity(0.4))

        }
}

#Preview {
    IngredientsScreen()
}
