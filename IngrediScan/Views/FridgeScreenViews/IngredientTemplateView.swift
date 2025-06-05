//
//  IngredientTemplateView.swift
//  IngrediScan
//
//  Created by Jan Keller on 05.06.25.
//

import SwiftUI

struct IngredientTemplateView: View {
    let ingredient: Ingredient
    @ObservedObject var fridge: MyFridge
    @State private var newAmount: String = ""
    
    
    var body: some View {
        HStack {
            Text(ingredient.name)
                .frame(maxWidth: 100, alignment: .leading)
            
            TextField("Menge", text: $newAmount)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(width: 80)
            .keyboardType(.decimalPad)
            
            Text(ingredient.unit.name)
                .frame(maxWidth: 32, alignment: .leading)
            
            Button(action: {
                addToFridge(ingredient: ingredient)
            }) {
                Text("->")
                    .font(.callout)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(5)
            }
        }
        .padding(6)
    }
    
    func addToFridge(ingredient: Ingredient) {
        if !newAmount.isEmpty {
            if let amount = Double(newAmount), amount > 0 {
                fridge.addIngredient(Ingredient(id: ingredient.id, name: ingredient.name, unit: ingredient.unit, amount: amount))
            }
        }
    }
}

#Preview {
    IngredientTemplateView(ingredient: Ingredient(id: 1, name: "Test", unit: Unit(id: 1, name: "kg"), amount: 1), fridge: MockFridge())
}


