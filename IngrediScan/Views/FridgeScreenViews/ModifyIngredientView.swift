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
    let ingredient: IngredientInFridge
    
    let size: CGSize = CGSize(width: 350, height: 350)
    let onClose: () -> Void
    
    @State private var newAmount: String = ""

    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Text(ingredient.name)
                    .font(.title)
                    .padding()

                Spacer()
                HStack {
                    TextField(String(format: "%.2f", ingredient.amount).replacingOccurrences(of: ".00", with: ""),text: $newAmount)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.leading)
                    
                    Text(ingredient.Unit.name)
                        .padding(.trailing)
                }

                Spacer()
                // save button
                HStack {
                    Button("Speichern") {
                        if let amount = Float(newAmount) {
                            let ingredientToAdd = IngredientInFridge(id: ingredient.id, name: ingredient.name, amount: amount-ingredient.amount, icon: ingredient.icon, Unit: ingredient.Unit)
                            viewModel.editIngredientInFridge(ingredientId: ingredientToAdd.id, amount: ingredientToAdd.amount, ingredient: ingredientToAdd)
                        }
                        onClose()
                    }
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding()
                    
                    
                    // delete button
                    Button("Löschen") {
                        let ingredientToAdd = IngredientInFridge(id: ingredient.id, name: ingredient.name, amount: ingredient.amount * -1, icon: ingredient.icon, Unit: ingredient.Unit)
                        viewModel.editIngredientInFridge(ingredientId: ingredient.id, amount: ingredient.amount * -1, ingredient: ingredientToAdd)
                        onClose()
                    }
                    .padding()
                    .foregroundColor(.orange)
                }
            }
            
            // close Button
            VStack {
                HStack {
                    Spacer()
                    Button(action: { onClose() }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.orange)
                            .scaleEffect(2)
                    }
                    .padding()
                }
                Spacer()
            }
        }
        .frame(width: size.width, height: size.height)
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(25)
        .shadow(radius: 10)
    }
}

#Preview {
    let ingredient = MockIngredients().ingredients.first!
    let ingredientInFridge: IngredientInFridge = .init(id: ingredient.id, name: ingredient.name, amount: 1, icon: "🥚", Unit: Unit(id: 1, name: "Stk"))
    
    ModifyIngredientView(ingredient: ingredientInFridge, onClose: {})
        .withPreviewEnvironmentObjects()
}


