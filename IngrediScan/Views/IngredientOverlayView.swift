//
//  IngredientOverlay.swift
//  IngrediScan
//
//  Created by Jan Keller on 14.05.25.
//


import SwiftUI

struct IngredientOverlayView: View {
    @Binding var ingredient: Ingredient
    let size: CGSize
    let onClose: () -> Void
    
    @State private var newAmount: String = ""

    var body: some View {
        VStack {
            Text(ingredient.name)
                .font(.title)
                .padding()

            Spacer()
            
            HStack {
                TextField(String(format: "%.2f", ingredient.amount).replacingOccurrences(of: ".00", with: ""),text: $newAmount)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.leading)
                
                Text(ingredient.unit)
                    .padding(.trailing)
            }

            Spacer()

            HStack {
                Button("Speichern") {
                    if let amount = Double(newAmount) {
                        ingredient.amount = amount
                    }
                    onClose()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding()
                
                Button("Schließen") {
                    onClose()
                }
                .padding()
            }
        }
        .frame(width: size.width, height: size.height)
        .background(Color.white)
        .cornerRadius(25)
        .shadow(radius: 10)
    }
}



