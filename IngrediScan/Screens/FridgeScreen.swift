//
//  FridgeScreen.swift
//  IngrediScan
//
//  Created by Faramir on 25.04.25.
//

import SwiftUI

struct FridgeScreen: View {
    @State private var searchText: String = ""
    @State private var buttonClicked = false
    @State private var fridge: MyFridge = MockFridge()
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading) {
                ScrollView(.horizontal) {
                    HStack {
                        Button("Vegetables") {
                            print("Vegetables")
                        }
                        .buttonBorderShape(.capsule)
                        .buttonStyle(.bordered)
                        
                        Button("Sweets") {
                            print("Sweets")
                        }
                        .buttonBorderShape(.capsule)
                        .buttonStyle(.bordered)
                        
                        Button("Meat") {
                            print("Meat")
                        }
                        .buttonBorderShape(.capsule)
                        .buttonStyle(.bordered)
                        
                        Button("Fruits") {
                            print("Fruits")
                        }
                        .buttonBorderShape(.capsule)
                        .buttonStyle(.bordered)
                        
                    }
                    .padding(.leading)
                }
                
                
                List(fridge.getIngredients()) { ingredient in
                    Text(ingredient.name)
                }
                .navigationTitle("My Fridge")
            }
        }
    }
}

#Preview {
    FridgeScreen()
}
