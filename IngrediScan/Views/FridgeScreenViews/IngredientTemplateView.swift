//
//  IngredientTemplateView.swift
//  IngrediScan
//
//  Created by Jan Keller on 05.06.25.
//

import SwiftUI

struct IngredientTemplateView: View {
    
    @EnvironmentObject var viewModel: ViewModel
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
                addToFridge(ingredient: ingredient)
            }
        }
        .padding(6)
    }
    
    func addToFridge(ingredient: Ingredient) {
        if !newAmount.isEmpty {
            if let amount = Double(newAmount), amount > 0 {
                let ingredientToAdd = IngredientInFridge(id: ingredient.id, name: ingredient.name, amount: Float(amount), Unit: ingredient.unit)
                viewModel.editIngredientInFridge(ingredientId: ingredientToAdd.id, amount: Float(amount), ingredient: ingredientToAdd)
            }
        }
    }
}

#Preview {
    IngredientTemplateView(ingredient: Ingredient(id: 1, name: "Test", unitId: 1, imageUrl: "eier", unit: Unit(id: 1, name: "Stk")))
}


