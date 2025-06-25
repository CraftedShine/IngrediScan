//
//  ShoppingListViewModel.swift
//  IngrediScan
//
//  Created by Faramir on 22.06.25.
//

import Foundation

@MainActor
class ShoppingListViewModel: ObservableObject {
    @Published var items: [ShoppingItem] = [ShoppingItem(ingredientId: 9, amount: 10), ShoppingItem(ingredientId: 10, amount: 10)]
    
    private let itemsKey = "shopping_items"
    
    init() {
        loadItems()
    }
    
    func addItem(_ item: ShoppingItem) {
        if !items.contains(where: { $0.ingredientId == item.ingredientId }) {
            items.append(item)
        }
        saveItems()
    }
    
    func toggleItem(_ item: ShoppingItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].isBought.toggle()
            saveItems()
        }
    }
    
    func deleteItem(_ item: ShoppingItem) {
        items.removeAll(where: { $0.id == item.id })
        saveItems()
    }
    
    func clearList() {
        items.removeAll()
    }
    
    private func saveItems() {
        if let data = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(data, forKey: itemsKey)
        }
    }
    
    private func loadItems() {
        if let data = UserDefaults.standard.data(forKey: itemsKey),
           let decoded = try? JSONDecoder().decode([ShoppingItem].self, from: data) {
            items = decoded
        }
    }
}
