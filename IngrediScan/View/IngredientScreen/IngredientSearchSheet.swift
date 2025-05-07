//
//  IngredientSearchSheet.swift
//  IngrediScan
//
//  Created by Faramir on 07.05.25.
//

import SwiftUI

struct IngredientSearchSheet: View {
    @State private var searchText: String = ""
    @State private var amountText: String = ""
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("Ingredient:")
                    .font(.headline .bold() .smallCaps())
                TextField("Zutat...", text: $searchText)
            }
            
            HStack {
                Text("Amount:")
                    .font(.headline .bold() .smallCaps())
                TextField("Menge...", text: $amountText)
            }
        }
    }
}

#Preview {
    IngredientSearchSheet(isPresented: .constant(true))
}
