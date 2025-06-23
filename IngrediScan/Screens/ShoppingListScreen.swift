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
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach($shoppingListViewModel.items) { $item in
                            ShoppingListItem(item: $item)
                        }
                        
                    }
                }
                
                ShoppingItemForm()
                    .padding(.bottom)
                    .focused($isTextFieldFocused)
            }
            .padding(.top)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Fertig") {
                        isTextFieldFocused = false
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("Einkaufsliste")
                        .font(.title .bold() .smallCaps())
                }
                ToolbarItem(placement: .confirmationAction) {
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
