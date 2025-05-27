//
//  DatabaseService.swift
//  IngrediScan
//
//  Created by Faramir on 26.05.25.
//

import Foundation
import Supabase

class DatabaseService {
    let supabase: SupabaseClient
    
    init() {
        supabase = SupabaseClient(
            supabaseURL: URL(string: "https://zglesyibcbwjoalbzdjp.supabase.co")!,
            supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpnbGVzeWliY2J3am9hbGJ6ZGpwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDczNzgxMzcsImV4cCI6MjA2Mjk1NDEzN30.zYi1Bxd8I0mbQfrW2WPya53fWsVqk8EdTTtbzqLZt5Q"
        )
    }
    
    func loadUnits() async -> [Unit] {
        do {
            let units: [Unit] = try await supabase.from("Units").select().execute().value
            return units
        } catch {
            print("Error while trying to fetch Units: \(error)")
        }
        return []
    }
    
    func loadTags() async -> [Tag] {
        do {
            let tags: [Tag] = try await supabase.from("Tags").select().execute().value
            return tags
        } catch {
            print("Error while trying to fetch Tags: \(error)")
        }
        return []
    }
    
    func loadIngredients() async -> [Ingredient] {
        do {
            let ingredients: [Ingredient] = try await supabase.from("Ingredients").select().execute().value
            return ingredients
        } catch {
            print("Error while trying to fetch Ingredients: \(error)")
        }
        return []
    }
    
    func loadRecipes() async -> [Recipe] {
        do {
            let recipes: [Recipe] = try await supabase.from("Recipes").select().execute().value
            return recipes
        } catch {
            print("Error while trying to fetch Recipes: \(error)")
        }
        return []
    }
    
    func loadHasSteps() async -> [hasSteps] {
        do {
            let result: [hasSteps] = try await supabase.from("hasSteps").select().execute().value
            return result
        } catch {
            print("Error while trying to fetch hasSteps: \(error)")
        }
        return []
    }
    
    func loadHasTags() async -> [hasTags] {
        do {
            let result: [hasTags] = try await supabase.from("hasTags").select().execute().value
            return result
        } catch {
            print("Error while trying to fetch hasTags: \(error)")
        }
        return []
    }
    
    func loadHasIngredients() async -> [usesIngredients] {
        do {
            let result: [usesIngredients] = try await supabase.from("usesIngredients").select().execute().value
            return result
        } catch {
            print("Error while trying to fetch hasIngredients: \(error)")
        }
        return []
    }
    
    // Only mapping is missing
}
