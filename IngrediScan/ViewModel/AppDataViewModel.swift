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
    var recipes: [Recipe] = []
    var favoriteRecipes: [Recipe] = []
    
    init() {
        let fileList: [String] = ["ItalianPizza", "MargheritaPizza", "CapreseSalad", "SpaghettiCabonara", "Tiramisu", "MinestroneSoup", "Focaccia", "Bruschetta", "Lasagne", "PannaCotta", "Gnocchi"]
        
        var jsonFiles: [Data?] = []
        
        fileList.forEach { file in
            jsonFiles.append(readLocalJSONFile(forName: file))
        }
        
        jsonFiles.forEach { jsonData in
            if let data = jsonData.self {
                if let recipe = parse(jsonData: data) {
                    self.recipes.append(recipe)
                }
            }
        }
    }
    
    func addFavorite(recipe: Recipe) {
        self.favoriteRecipes.append(recipe)
    }
    
    func isFavorite(recipe: Recipe) -> Bool {
        return (self.favoriteRecipes.firstIndex(of: recipe) != nil)
    }
    
    func removeFavorite(recipe: Recipe) {
        if let index = self.favoriteRecipes.firstIndex(of: recipe) {
            self.favoriteRecipes.remove(at: index)
        }
    }
    
    func parse(jsonData: Data) -> Recipe? {
        do {
            let decodedData = try JSONDecoder().decode(Recipe.self, from: jsonData)
            return decodedData
        } catch {
            print("error: \(error)")
        }
        return nil
    }
    
    func readLocalJSONFile(forName name: String) -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            }
        } catch {
            print("error: \(error)")
        }
        return nil
    }
}


