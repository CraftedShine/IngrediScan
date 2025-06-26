//
//  ShoppingListItem.swift
//  IngrediScan
//
//  Created by Faramir on 22.06.25.
//

import SwiftUI

struct ShoppingListItem: View {
    @EnvironmentObject private var viewModel: ViewModel
    @EnvironmentObject private var shoppingListViewModel: ShoppingListViewModel
    @EnvironmentObject private var fridgeViewModel: FridgeViewModel
    @Binding var item: ShoppingItem
    
    var body: some View {
        if let ingredient = viewModel.getIngredient(item.ingredientId) {
            HStack {
                if let icon = ingredient.icon {
                    Text(icon)
                        .padding(8)
                        .background(.gray)
                        .clipShape(Circle())
                        .padding(.trailing)
                }
                
                Text(ingredient.name)
                    .font(.headline .smallCaps() .bold())
                
                Text(String(item.amount))
                    .font(.subheadline .bold())
                    .foregroundStyle(.secondary)
                
                Text(ingredient.unit.name)
                    .font(.subheadline .bold())
                    .foregroundStyle(.secondary)
                
                Spacer()
            }
            .onTapGesture {
                shoppingListViewModel.toggleItem(item)
            }
            .padding()
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(16)
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
            .overlay {
                if item.isBought {
                    ZStack(alignment: .trailing) {
                        
                        RoundedRectangle(cornerRadius: 16)
                            .opacity(0.3)
                            .padding(.horizontal)
                        
                        Rectangle()
                            .fill(Color.black.opacity(0.5))
                            .frame(height: 2)
                            .padding(.horizontal, 8)
                        
                        CircularButton(size: 20, padding: 10, color: item.isBought ? .red.opacity(0.8) : .green, image: "trash") {
                            let newItem = FridgeItem(ingredientId: ingredient.id, amount: item.amount)
                            
                            fridgeViewModel.addItem(newItem)
                            
                            
                            shoppingListViewModel.deleteItem(item)
                        }
                        .padding(.horizontal, 32)
                    }
                }
            }
        }
    }
}

#Preview {
    VStack {
        ShoppingListItem(item: .constant(ShoppingItem(ingredientId: 9, amount: 100, isBought: true)))
        ShoppingListItem(item: .constant(ShoppingItem(ingredientId: 9, amount: 100)))
    }
    .withPreviewEnvironmentObjects()
}
