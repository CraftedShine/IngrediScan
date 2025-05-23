//
//  IngredientSelectionView.swift
//  IngrediScan
//
//  Created by Jan Keller on 21.05.25.
//

import SwiftUI

struct IngredientSelectionView: View {
    
    @Binding var selectedIngredients: Set<String>
    var ingredientOptions: Array<String>
    
    var body: some View {
        VStack(spacing: 15) {
            Text("Zutaten auswählen")
                .font(.headline)

            ForEach(ingredientOptions, id: \.self) { ingredient in
                Button(action: {
                    if selectedIngredients.contains(ingredient) {
                        selectedIngredients.remove(ingredient)
                    } else {
                        selectedIngredients.insert(ingredient)
                    }
                }) {
                    HStack {
                        Text(ingredient)
                            .font(.body)
                            .foregroundColor(.primary)
                        Spacer()
                        Image(systemName: selectedIngredients.contains(ingredient) ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(selectedIngredients.contains(ingredient) ? .blue : .gray)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 2))
                }
            }
            Spacer().frame(height: 80)
        }
        .padding(.horizontal, 20)
    }
}


