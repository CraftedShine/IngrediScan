//
//  ShoppingItemForm.swift
//  IngrediScan
//
//  Created by Faramir on 22.06.25.
//

import SwiftUI

struct ShoppingItemForm: View {
    @EnvironmentObject private var viewModel: ViewModel
    @EnvironmentObject private var shoppingListViewModel: ShoppingListViewModel
    @State private var selection: Int = 9
    @State private var selectedAmount: Int?
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Zutat hinzufügen")
                .font(.subheadline.smallCaps().bold())
                .foregroundColor(.secondary)
            
            HStack {
                Image(systemName: "cart.fill")
                    .padding(8)
                    .background(.gray)
                    .clipShape(Circle())
                
                Picker("Zutat", selection: $selection) {
                    ForEach(viewModel.ingredients) { ingredient in
                        Text(ingredient.name)
                            .font(.body)
                    }
                }
                .font(.headline .bold() .smallCaps())
                .pickerStyle(.menu)
                .tint(.primary)
                
                TextField("Menge", value: $selectedAmount, format: .number)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(.subheadline .bold())
                    .foregroundStyle(.secondary)
                    .focused($isTextFieldFocused)
                
                if let ingredient = viewModel.getIngredient(selection) {
                    Text(ingredient.unit.name)
                        .font(.subheadline .bold())
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                    
                    CircularButton(size: 20, padding: 10,color: .orange, image: "plus") {
                        if let amount = selectedAmount {
                            let newItem = ShoppingItem(ingredientId: selection, amount: amount)
                            
                            shoppingListViewModel.addItem(newItem)
                            isTextFieldFocused = false
                            selectedAmount = nil
                        }
                    }
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ShoppingItemForm()
        .withPreviewEnvironmentObjects()
}
