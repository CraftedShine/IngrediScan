//
//  IngredientList.swift
//  IngrediScan
//
//  Created by Jan Keller on 14.05.25.
//

import Foundation

class IngredientTemplateList {
    private var ingredientTemplates: [IngredientTemplate] = []
    
    func addIngredientTemplate(_ ingredientTemplate: IngredientTemplate) {
        ingredientTemplates.append(ingredientTemplate)
    }
    
    func getIngredientTemplates() -> [IngredientTemplate] {
        return ingredientTemplates
    }
}
