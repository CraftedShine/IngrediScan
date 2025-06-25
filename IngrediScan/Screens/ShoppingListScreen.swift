//
//  ShoppingListScreen.swift
//  IngrediScan
//
//  Created by Faramir on 22.06.25.
//

import SwiftUI

struct ShoppingListScreen: View {
    @EnvironmentObject private var viewModel: ViewModel
    @EnvironmentObject private var shoppingListViewModel: ShoppingListViewModel
    @State private var showConfirmation: Bool = false
    @State private var showForm: Bool = true
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                ScrollView {
                    VStack(alignment: .leading) {
                        if shoppingListViewModel.items.isEmpty {
                            Text("Die Einkaufsliste ist leer.")
                                .font(.callout .bold() .smallCaps())
                                .foregroundStyle(.secondary)
                        } else {
                            ForEach($shoppingListViewModel.items) { $item in
                                ShoppingListItem(item: $item)
                            }
                        }
                    }
                }
            }
            .padding(.top)
            .presentationDragIndicator(.visible)
            .sheet(isPresented: $showForm) {
                ShoppingItemForm()
                    .presentationCornerRadius(16)
                    .presentationDetents([.fraction(0.125)])
                    .presentationBackgroundInteraction(.enabled)
                    .presentationBackground(Color(UIColor.secondarySystemBackground))
                    .presentationDragIndicator(.visible)
                    .focused($isTextFieldFocused)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Fertig") {
                        isTextFieldFocused = false
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    CircularButton(size: 20, padding: 10, color: .orange, image: !showForm ? "cart.badge.plus.fill" : "cart.fill.badge.minus") {
                        showForm.toggle()
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("Einkaufsliste")
                        .font(.title .bold() .smallCaps())
                }
                ToolbarItem(placement: .cancellationAction) {
                    CircularButton(size: 20, padding: 10, color: .orange, image: "xmark") {
                        showConfirmation.toggle()
                    }
                    .confirmationDialog("Möchtest du Liste wirklich leeren?", isPresented: $showConfirmation, titleVisibility: .visible) {
                        Button("Löschen", role: .destructive) {
                            // Aktion hier ausführen
                            shoppingListViewModel.clearList()
                        }
                        
                        Button("Abbrechen", role: .cancel) { }
                    }
                }
            }
        }
    }
}

#Preview {
    ShoppingListScreen()
        .withPreviewEnvironmentObjects()
}
