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
            }
            .padding(.top)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Einkaufsliste")
                        .font(.title .bold() .smallCaps())
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        showConfirmation.toggle()
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .padding(10)
                            .foregroundStyle(.white)
                            .background(Color.orange.opacity(0.75))
                            .clipShape(Circle())
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
