//
//  FridgeScreen.swift
//  IngrediScan
//
//  Created by Fynn Schotten on 25.04.25.
//

import SwiftUI

struct FridgeScreen: View {
    @StateObject private var fridge: MyFridge = MockFridge()
    @State private var selectedIngredient: Ingredient?
    @State private var showIngredientSheet = false
    @State private var isEditing = false
    @State private var boxSize: CGSize = CGSize(width: 350, height: 350)
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    
                    // List of ingredients formatted in box views
                    ScrollView {
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 25) {
                            ForEach(fridge.getIngredients()) { ingredient in
                                IngredientBoxView(ingredient: ingredient, isEditing: $isEditing, onDelete: {
                                    fridge.removeIngredient(ingredient: ingredient)
                                })
                                .onTapGesture {
                                    if !isEditing {
                                        selectedIngredient = ingredient
                                    }
                                    isEditing = false
                                }
                            }
                        }
                        .padding()
                    }
                    
                    // add button -> opens a sheet
                    HStack {
                        Spacer()
                        Button(action: {
                            if !isEditing {
                                showIngredientSheet = true
                            }
                            isEditing = false
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 70, height: 70)
                                .foregroundColor(.blue)
                                .padding(.trailing, 20)
                        }
                        .sheet(isPresented: $showIngredientSheet) {
                            IngredientTemplateListView(fridge: fridge)
                        }
                        
                    }
                }
                
                // overlay view after tapping on an ingredient box
                if let ingredient = selectedIngredient {
                    Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            selectedIngredient = nil
                        }
                    
                    IngredientOverlayView(
                        ingredient: ingredient, fridge: fridge,
                        onClose: { selectedIngredient = nil }
                    )
                }
            }
            .navigationTitle("My Fridge")
            .onTapGesture {
                isEditing = false
            }
        }
    }
}


#Preview {
    FridgeScreen()
}




