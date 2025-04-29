//
//  IngredientList.swift
//  IngrediScan
//
//  Created by Faramir on 29.04.25.
//

import SwiftUI

struct IngredientList: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Ingredients")
                .font(.subheadline .smallCaps() .bold())
                .foregroundColor(.gray)
                .padding(.leading)
            
            // Ingredients List
            List {
                Text("Tomaten 2 Stk.")
                Text("Mehl 200g")
                Text("Backpulver 2EL")
            }
            .listStyle(.plain)
            .scrollDisabled(true)
            .frame(minHeight: 150)
        }
    }
}

#Preview {
    IngredientList()
}
