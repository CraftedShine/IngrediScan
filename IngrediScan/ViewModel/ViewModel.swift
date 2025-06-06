//
//  RecipeViewModel.swift
//  IngrediScan
//
//  Created by Faramir on 21.05.25.
//

import Foundation
import SwiftUI
import Supabase

@MainActor
class ViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var categories: [Category] = []
    @Published var tags: [Tag] = []
    
    private var service: DatabaseService = DatabaseService()

    init() {
        Task {
            await loadRecipesFromDb()
            await loadTagsFromDb()
        }
    }
    
    func loadRecipesFromDb() async {
        do {
            let data = try await DatabaseService.shared.loadRecipes()
            self.recipes = data
        } catch {
            print(error)
        }
    }
    
    func loadTagsFromDb() async {
        self.tags = await service.loadTags()
    }
}
