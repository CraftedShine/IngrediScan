//
//  FridgeScreen.swift
//  IngrediScan
//
//  Created by Fynn Schotten on 25.04.25.
//

import SwiftUI

struct FridgeScreen: View {
    
    @EnvironmentObject var viewModel: ViewModel
    @State private var selectedIngredient: IngredientInFridge?
    @State private var showIngredientSheet = false
    @State private var isEditing = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    
                    // List of ingredients formatted in box views
                    ScrollView {
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 20) {
                            ForEach(viewModel.fridge.getIngredients()) { ingredient in
                                IngredientBoxView(ingredient: ingredient, isEditing: $isEditing, onDelete: {
                                    viewModel.editIngredientInFridge(ingredientId: ingredient.id, amount: ingredient.amount * -1, ingredient: ingredient)
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
                                .frame(width: 60, height: 60)
                                .foregroundColor(.orange)
                                .padding(.trailing, 4)
                        }
                        .padding()
                        .sheet(isPresented: $showIngredientSheet) {
                            IngredientTemplateListView()
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
                        ingredient: ingredient,
                        onClose: { selectedIngredient = nil }
                    )
                }
            }
            .onTapGesture {
                isEditing = false
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("My Frigde")
                        .font(.title .bold() .smallCaps())
                }
                
            }
        }
    }
}

#Preview {
    FridgeScreen()
        .environmentObject(ViewModel())
}




