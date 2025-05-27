//
//  IngredientTemplateListView.swift
//  IngrediScan
//
//  Created by Jan Keller on 14.05.25.
//

import SwiftUI

struct IngredientTemplateListView: View {
    @ObservedObject var fridge: MyFridge
    @Environment(\.dismiss) var dismiss
    public var ingredientTemplateList: [String] = ["a","b","c","d","e","f","g","h","i","j"]
    
    var body: some View {
        NavigationView {
            List(ingredientTemplateList, id: \.self) { template in
                Button(action: {
                    let unit = Unit(id: 100, name: "Stk")
                    let newIngredient = Ingredient(id: 8, name: template, unit: unit, amount: 1)
                    fridge.addIngredient(newIngredient)
                }) {
                    HStack {
                        Text(template)
                        Spacer()
                        Text("Standardmenge: 1 Stück")
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Zutat hinzufügen")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        dismiss() // Schließt das Sheet
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.blue)
                    }
                }
            }
        }
    }
}


