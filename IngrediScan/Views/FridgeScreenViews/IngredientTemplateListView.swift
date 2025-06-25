//
//  IngredientTemplateListView.swift
//  IngrediScan
//
//  Created by Jan Keller on 14.05.25.
//

import SwiftUI

struct IngredientTemplateListView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    @Environment(\.dismiss) var dismiss
    var ingredientTemplates: [Ingredient] {
        viewModel.ingredients
    }
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
                    IngredientTemplateView(ingredient: ingredient)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Spacer()
                        Text("Zutaten hinzufügen")
                            .font(.title .bold() .smallCaps())
                        Spacer()
                        
                        CircularButton(size: 20, padding: 10, color: .orange, image: "xmark") {
                            dismiss()
                        }
                    }
                }
            }

        }
    }
}




#Preview {
    IngredientTemplateListView()
        .withPreviewEnvironmentObjects()
}


