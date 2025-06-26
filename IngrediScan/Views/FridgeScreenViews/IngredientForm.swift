//
//  IngredientTemplateView.swift
//  IngrediScan
//
//  Created by Jan Keller on 05.06.25.
//

import SwiftUI

struct IngredientForm: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: ViewModel
    @EnvironmentObject var fridgeViewModel: FridgeViewModel
    let ingredient: Ingredient
    @State private var newAmount: String = ""
    
    
    var body: some View {
        HStack {
            Text(ingredient.name)
                .font(.headline .bold() .smallCaps())
                .frame(maxWidth: 100, alignment: .leading)
            
            Spacer()
            
            TextField("Menge", text: $newAmount)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 80)
                .keyboardType(.decimalPad)
            
            Text(ingredient.unit.name)
                .font(.subheadline .bold())
                .foregroundStyle(.secondary)
                .frame(maxWidth: 40, alignment: .leading)
            
            CircularButton(size: 20, padding: 10, color: .orange, image: "plus") {
                if let amount = Float(newAmount) {
                    fridgeViewModel.addItem(FridgeItem(ingredientId: ingredient.id, amount: amount))
                }
                dismiss()
            }
        }
        .padding(6)
    }
}

#Preview {
    IngredientForm(ingredient: Ingredient(id: 1, name: "Eier", unitId: 1, icon: "🥚", unit: Unit(id: 1, name: "Stk")))
        .withPreviewEnvironmentObjects()
}


