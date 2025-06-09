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
    
    init() {
        Task {
            await loadRecipes()
            await loadTags()
        }
    }
    
    func loadRecipes() async {
        self.recipes = await DatabaseService.shared.fetchRecipes()
    }
    
    func loadTags() async {
        self.tags = await DatabaseService.shared.fetchTags()
    }
}
