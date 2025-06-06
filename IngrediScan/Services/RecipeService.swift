//
//  RecipeService.swift
//  IngrediScan
//
//  Created by Faramir on 21.05.25.
//

import Foundation

class RecipeService {
    private var databaseService: DatabaseService = .init()
    
    func loadRecipes() async -> [Recipe] {
        #if targetEnvironment(simulator)
        return MockData().recipes
        #else
        
        return await databaseService.loadRecipes()
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
