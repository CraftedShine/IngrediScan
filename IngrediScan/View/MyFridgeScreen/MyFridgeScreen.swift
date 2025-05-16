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
                    ScrollView {
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 25) {
                            ForEach(fridge.getIngredients()) { ingredient in
                                IngredientBoxView(ingredient: ingredient, isEditing: $isEditing, onDelete: {
                                    fridge.removeIngredient(ingredient: ingredient)
                                })
                                .onTapGesture {
                                    selectedIngredient = ingredient
                                    isEditing = false
                                }
                            }
                        }
                        .padding()
                    }
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            isEditing = false
                            showIngredientSheet = true
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
                
                if let ingredient = selectedIngredient {
                    Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            selectedIngredient = nil
                        }
                    
                    IngredientOverlayView(
                        ingredient: Binding(
                            get: { ingredient },
                            set: { selectedIngredient = $0 }
                        ),
                        size: boxSize,
                        onClose: { selectedIngredient = nil }
                    )
                }
            }
            .navigationTitle("My Fridge")
        }
    }
}


#Preview {
    FridgeScreen()
}




