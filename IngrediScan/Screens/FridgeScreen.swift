//
//  FridgeScreen.swift
//  IngrediScan
//
//  Created by Fynn Schotten on 25.04.25.
//

import SwiftUI

struct FridgeScreen: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var fridgeViewModel: FridgeViewModel
    @EnvironmentObject var viewModel: ViewModel
    @State private var showForm: Bool = false
    @State private var isEditing: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                VStack {
                    if(self.fridgeViewModel.items.isEmpty) {
                        Text("Du hast noch keine Zutaten im Kühlschrank.")
                            .font(.callout .bold() .smallCaps())
                            .foregroundStyle(.secondary)
                            .padding(30)
                    }
                    
                    ScrollView {
                        VStack {
                            ForEach($fridgeViewModel.items) { $ingredient in
                                IngredientCard(item: $ingredient)
                                    .fullScreenCover(isPresented: $isEditing) {
                                        ModifyIngredientView(item: ingredient)
                                    }
                                    .onTapGesture {
                                        isEditing.toggle()
                                    }
                            }
                        }
                    }
                }
                    
                    CircularButton(color: .orange, image: "plus") {
                        showForm.toggle()
                    }
                    .sheet(isPresented: $showForm) {
                        AddIngredientView()
                            .presentationDragIndicator(.visible)
                    }
                    .padding(8)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("My Frigde")
                        .font(.title .bold() .smallCaps())
                }
                
            }
            .padding(.top)
        }
    }
}

#Preview {
    FridgeScreen()
        .withPreviewEnvironmentObjects()
}




