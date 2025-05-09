//
//  IngredientsScreen.swift
//  IngrediScan
//
//  Created by Faramir on 25.04.25.
//

import SwiftUI

struct IngredientsScreen: View {
    @State var ingredients: [Ingredient] = PizzaMock().ingredients
    @State private var showSearch: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                YourIngredientList()
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showSearch.toggle()
                    } label: {
                        Image(systemName: "plus.circle")
                    }
                }
            }
            .sheet(isPresented: $showSearch) {
                IngredientSearchSheet(isPresented: $showSearch)
                    .presentationDragIndicator(.visible)
                    .presentationDetents([.fraction((0.999))])
            }
        }
    }
}

#Preview {
    IngredientsScreen()
}
