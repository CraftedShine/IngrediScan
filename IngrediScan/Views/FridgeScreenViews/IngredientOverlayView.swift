//
//  IngredientOverlay.swift
//  IngrediScan
//
//  Created by Jan Keller on 14.05.25.
//


import SwiftUI
import SwiftData

struct IngredientOverlayView: View {
    
    @Environment(\.modelContext) private var modelContext
    let ingredient: IngredientInFridge
    @Bindable var fridge: MyFridge
    
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
                        if let amount = Double(newAmount) {
                            if amount > 0 {
                                let ingredientToAdd = IngredientInFridge(id: ingredient.id, name: ingredient.name, amount: Float(amount) - ingredient.amount, Unit: ingredient.Unit)
                                fridge.addIngredient(ingredientToAdd)
                            } else {
                                fridge.removeIngredient(ingredient: ingredient)
                            }
                        }
                        onClose()
                        try? modelContext.save()
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding()
                    
                    
                    // delete button
                    Button("Löschen") {
                        fridge.removeIngredient(ingredient: ingredient)
                        onClose()
                        try? modelContext.save()
                    }
                    .padding()
                }
            }
            
            // close Button
            VStack {
                HStack {
                    Spacer()
                    Button(action: { onClose() }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.red)
                            .scaleEffect(2)
                    }
                    .padding()
                }
                Spacer()
            }
        }
        .frame(width: size.width, height: size.height)
        .background(Color.white)
        .cornerRadius(25)
        .shadow(radius: 10)
    }
}



