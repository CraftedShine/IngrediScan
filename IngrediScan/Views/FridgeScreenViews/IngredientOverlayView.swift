//
//  IngredientOverlay.swift
//  IngrediScan
//
//  Created by Jan Keller on 14.05.25.
//


import SwiftUI

struct IngredientOverlayView: View {
    
    let ingredient: IngredientInFridge
    @State var fridge: MyFridge
    
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
                                let ingredientToAdd = Ingredient(id: ingredient.id, name: ingredient.name, unitId: "1", unit: Unit(id: "1", name: "Stk")) //TODO
                                fridge.addIngredient(ingredientToAdd)
                            } else {
                                fridge.removeIngredient(ingredient: ingredient)
                            }
                        }
                        onClose()
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



