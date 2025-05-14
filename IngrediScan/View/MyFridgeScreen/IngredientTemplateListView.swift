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
    @State private var ingredientTemplates: [IngredientTemplate] = IngredientTemplateListMock().getIngredientTemplates()
    
    var body: some View {
        NavigationView {
            List(ingredientTemplates) { template in
                Button(action: {
                    let newIngredient = Ingredient(name: template.name, amount: 1.0, unit: "Stück")
                    fridge.addIngredient(newIngredient)
                }) {
                    HStack {
                        Text(template.name)
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


