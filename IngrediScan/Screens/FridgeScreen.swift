//
//  FridgeScreen.swift
//  IngrediScan
//
//  Created by Faramir on 25.04.25.
//

import SwiftUI

struct FridgeScreen: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Vegetables")) {
                    Text("Potatoes")
                    Text("Tomatoes")
                    Text("Onions")
                }
                Section(header: Text("Meat")) {
                    Text("Chicken")
                    Text("Beef")
                    Text("Porkchop")
                }
                Section(header: Text("Fruits")) {
                    Text("Bananas")
                    Text("Apples")
                    Text("Pineapples")
                }
                
            }
            .navigationTitle("My Fridge")
            .listStyle(GroupedListStyle())
        }
    }
}

#Preview {
    FridgeScreen()
}
