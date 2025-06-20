//
//  IngredientTemplateListView.swift
//  IngrediScan
//
//  Created by Jan Keller on 14.05.25.
//

import SwiftUI

struct IngredientTemplateListView: View {
    
    @State var fridge: MyFridge
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
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Spacer()
                        Text("Zutaten hinzufügen")
                            .font(.title)
                        Spacer()
                        Button(action: {
                            dismiss()
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.red)
                                .scaleEffect(1.4)
                                .padding(5)
                        }
                    }
                }
            }

        }
    }
}




struct IngredientTemplateListView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientTemplateListView(fridge: MockFridge())
    }
}


