//
//  AppDataViewModel.swift
//  IngrediScan
//
//  Created by Faramir on 09.05.25.
//

import SwiftUI
import Foundation

@Observable
class AppDataViewModel {
    var selectedTab: Int = 0
    var recipes: [Recipe] = [PizzaMock(), PastaMock(), BurgerMock(), SushiMock()]
    var favoriteRecipes: [Recipe] = [PizzaMock(), PastaMock(), BurgerMock(), SushiMock()]
    
    func addRecipeToFavorites(_ recipe: Recipe) {
        favoriteRecipes.append(recipe)
    }
    
    func removeRecipeFromFavorites(_ recipe: Recipe) {
        if let index = favoriteRecipes.firstIndex(of: recipe) {
            favoriteRecipes.remove(at: index)
        }
    }
}
