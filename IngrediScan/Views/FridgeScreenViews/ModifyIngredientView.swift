//
//  ModifyIngredientSheet.swift
//  IngrediScan
//
//  Created by Jan Keller on 14.05.25.
//


import SwiftUI

struct ModifyIngredientView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: ViewModel
    @EnvironmentObject var fridgeViewModel: FridgeViewModel
    let item: FridgeItem
    
    @State private var newAmount: String = ""
    
    var body: some View {
        if let ingredient = viewModel.getIngredient(item.ingredientId) {
            VStack(alignment: .trailing, spacing: 0) {
                DismissButton(dismiss: _dismiss)
                
                HStack(spacing: 8) {
                    Text(ingredient.name)
                        .font(.headline .bold() .smallCaps())
                    
                    TextField(String(format: "%.0f", item.amount),text: $newAmount)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Text(ingredient.unit.name)
                        .font(.subheadline .bold())
                        .foregroundStyle(.secondary)
                }
                .padding(.horizontal)
                
                HStack {
                    RoundedRectangularButton(title: "Speichern", color: .white, backgroundColor: .green) {
                        if let amount = Float(newAmount) {
                            let newItem = FridgeItem(ingredientId: ingredient.id, amount: amount)
                            
                            fridgeViewModel.modifyItem(newItem)
                        }
                        dismiss()
                    }
                    
                    RoundedRectangularButton(title: "Löschen", color: .white, backgroundColor: .red) {
                        fridgeViewModel.deleteItem(item)
                        dismiss()
                    }
                }
                .padding()
            }
            .frame(maxWidth: 350, maxHeight: 200)
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(16)
            .shadow(radius: 10)
        }
    }
}

#Preview {
    ModifyIngredientView(item: FridgeItem(ingredientId: 9, amount: 10))
        .withPreviewEnvironmentObjects()
}


