//
//  RecipeService.swift
//  IngrediScan
//
//  Created by Faramir on 21.05.25.
//

import Foundation

class RecipeService {
    func loadRecipes() -> [Recipe] {
        #if targetEnvironment(simulator)
        return MockData().recipes
        #else
        
        let fileList: [String] = ["ItalianPizza", "MargheritaPizza", "CapreseSalad", "SpaghettiCabonara", "Tiramisu", "MinestroneSoup", "Focaccia", "Bruschetta", "Lasagne", "PannaCotta", "Gnocchi"]
        
        var jsonFiles: [Data?] = []
        
        fileList.forEach { file in
            jsonFiles.append(readLocalJSONFile(forName: file))
        }
        
        var recipes: [Recipe] = []
        
        jsonFiles.forEach { jsonData in
            if let data = jsonData.self {
                if let recipe = parse(jsonData: data) {
                    recipes.append(recipe)
                }
            }
        }
        
        return recipes
        #endif
    }
    
    
    private func parse(jsonData: Data) -> Recipe? {
        do {
            let decodedData = try JSONDecoder().decode(Recipe.self, from: jsonData)
            return decodedData
        } catch {
            print("error: \(error)")
        }
        return nil
    }
    
    private func readLocalJSONFile(forName name: String) -> Data? {
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
