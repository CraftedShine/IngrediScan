//
//  IngredientTemplateListView.swift
//  IngrediScan
//
//  Created by Jan Keller on 14.05.25.
//

import SwiftUI

import SwiftUI

struct IngredientTemplateListView: View {
    @ObservedObject var fridge: MyFridge
    @Environment(\.dismiss) var dismiss
    var ingredientTemplates: [Ingredient] = MockIngredients().ingredients
    @State private var searchText = ""

    var filteredIngredients: [Ingredient] {
        if searchText.isEmpty {
            return ingredientTemplates
        } else {
            return ingredientTemplates.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Suche Zutaten...", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                List(filteredIngredients) { ingredient in
                    IngredientTemplateView(ingredient: ingredient, fridge: fridge)
                }
            }
            .navigationTitle("Zutaten hinzufügen")
            .navigationBarItems(trailing: Button(action: {
                dismiss()
            }) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.red)
                    .scaleEffect(1.75)
                    .padding(5)
            })
        }
    }
}




struct IngredientTemplateListView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientTemplateListView(fridge: MockFridge())
    }
}


