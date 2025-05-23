//
//  IngredientSearchPickerView.swift
//  IngrediScan
//
//  Created by Jan Keller on 21.05.25.
//

import SwiftUI

struct IngredientSearchPickerView: View {
    
    @Binding var searchOnlyWithAvailableIngredients: Bool
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Zutaten-Auswahl:")
                .font(.headline)
            
            Picker("Suchmodus", selection: $searchOnlyWithAvailableIngredients) {
                Text("Nur vorhandene Zutaten").tag(true)
                Text("Rezepte mit fehlenden Zutaten").tag(false)
            }
            .pickerStyle(SegmentedPickerStyle())
        }
        .padding()
    }
}

