//
//  RecipeViewModel.swift
//  IngrediScan
//
//  Created by Faramir on 21.05.25.
//

import Foundation
import SwiftUI

class RecipeViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var categories: [Category] = []
    @Published var tags: [Tag] = [Tag(id: 1, name: "Italienisch"), Tag(id: 2, name: "Spanisch"), Tag(id: 3, name: "Französisch"), Tag(id: 4, name: "Türkisch"), Tag(id: 5, name: "Einfach")]
    private var service: RecipeService = RecipeService()
    
    init() {
        self.recipes = service.loadRecipes()
    }
}
