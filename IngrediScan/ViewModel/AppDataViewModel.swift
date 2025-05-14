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
        let jsonFiles: [Data?] = [
            readLocalJSONFile(forName: "ItalianPizza"),
            readLocalJSONFile(forName: "MargheritaPizza"),
            readLocalJSONFile(forName: "CapreseSalad"),
            readLocalJSONFile(forName: "SpaghettiCabonara"),
            readLocalJSONFile(forName: "Tiramisu"),
            readLocalJSONFile(forName: "MinestroneSoup"),
            readLocalJSONFile(forName: "Focaccia"),
            readLocalJSONFile(forName: "Bruschetta"),
            readLocalJSONFile(forName: "Lasagne"),
            readLocalJSONFile(forName: "PannaCotta"),
            readLocalJSONFile(forName: "Gnocchi"),
        ]
        
        jsonFiles.forEach { jsonData in
            if let data = jsonData.self {
                if let recipe = parse(jsonData: data) {
                    self.recipes.append(recipe)
                }
            }
        }
        
        self.favoriteRecipes = self.recipes
        
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
