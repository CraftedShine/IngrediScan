//
//  FridgeViewModel.swift
//  IngrediScan
//
//  Created by Jan Keller on 26.06.25.
//

import SwiftUI

class FridgeViewModel: ObservableObject {
    @Published var items: [FridgeItem] = []
    
    private let itemsKey = "fridgeIngredientsKeys"
    
    init() {
        loadItems()
    }
    
    func addItem(_ item: FridgeItem) {
        if !items.contains(where: { $0.ingredientId == item.ingredientId }) {
            items.append(item)
        } else {
            modifyItem(item)
        }
        saveItems()
    }
    
    func modifyItem(_ item: FridgeItem) {
        if let index = items.firstIndex(where: { $0.ingredientId == item.ingredientId}) {
            items[index].amount = item.amount
        }
        
        saveItems()
    }
    
    func deleteItem(_ item: FridgeItem) {
        items.removeAll(where: { $0.ingredientId == item.ingredientId })
        saveItems()
    }
    
    func ingredientsMissing(recipe: Recipe) -> Int {
        var missingCount = 0
        let requiredIngredients = recipe.usesIngredients
        
        for requiredIngredient in requiredIngredients {
            if let fridgeIngredient = items.first(where: { $0.ingredientId == requiredIngredient.ingredientId }){
                if fridgeIngredient.amount < requiredIngredient.amount {
                    missingCount += 1
                }
            } else {
                missingCount += 1
            }
        }
        return missingCount
    }
    
    private func saveItems() {
        if let data = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(data, forKey: itemsKey)
        }
    }
    
    private func loadItems() {
        if let data = UserDefaults.standard.data(forKey: itemsKey),
           let decoded = try? JSONDecoder().decode([FridgeItem].self, from: data) {
            items = decoded
        }
    }
}
