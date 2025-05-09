//
//  RecipeListHeader.swift
//  IngrediScan
//
//  Created by Faramir on 30.04.25.
//

import SwiftUI

struct IngredientListHeader: View {
    var body: some View {
        HStack {
            Text("Ingredient")
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("Amount")
                .bold()
                .frame(width: .infinity, alignment: .trailing)
        }
    }
}

#Preview {
    IngredientListHeader()
}
