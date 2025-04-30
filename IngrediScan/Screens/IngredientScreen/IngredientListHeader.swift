//
//  RecipeListHeader.swift
//  IngrediScan
//
//  Created by Faramir on 30.04.25.
//

import SwiftUI

struct IngredientListHeader: View {
    var body: some View {
        HStack (alignment: .center) {
            Text("Ingredient")
            Text("Amount")
        }
    }
}

#Preview {
    IngredientListHeader()
}
