//
//  RecipeService.swift
//  IngrediScan
//
//  Created by Faramir on 21.05.25.
//

import Foundation
import Supabase

class DatabaseService {
    static let shared = DatabaseService()
    
    let supabase: SupabaseClient = SupabaseClient(
        supabaseURL: URL(string: "https://zglesyibcbwjoalbzdjp.supabase.co")!,
        supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpnbGVzeWliY2J3am9hbGJ6ZGpwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDczNzgxMzcsImV4cCI6MjA2Mjk1NDEzN30.zYi1Bxd8I0mbQfrW2WPya53fWsVqk8EdTTtbzqLZt5Q"
    )
    
    func fetchRecipes() async -> [Recipe] {
        do {
            let response = try await supabase
                .from("Recipes")
                .select("""
                *,
                category:Categories!Recipes_categoryId_fkey(*),
                usesIngredients:usesIngredients!usesIngredients_recipeId_fkey(*,
                    ingredient:Ingredients!usesIngredients_ingredientId_fkey(*),
                    unit:Units!usesIngredients_unitId_fkey(*)
                ),
                hasSteps:hasSteps!hasSteps_recipeId_fkey(*,RecipeStep:RecipeStep!hasSteps_stepId_fkey(*)),
                hasTags:hasTags!hasTags_recipeId_fkey(*,Tag:Tags!hasTags_tagId_fkey(*))
                """)
                .execute()
            print("#### Fetching Recipes from Supabase ####")
            print("Status: \(response.status)")
            print("Fetched: \(response.data)")
            
            let recipes = try JSONDecoder().decode([Recipe].self, from: response.data)
            print(recipes)
            
            return recipes
        } catch {
            print(error)
            return []
        }
    }
    
    func fetchTags() async -> [Tag] {
        do {
            let response = try await supabase
                .from("Tags")
                .select("*")
                .execute()
            
            print("#### Fetching Tags from Supabase ####")
            print("Status: \(response.status)")
            print("Fetched: \(response.data)")
            
            let tags = try JSONDecoder().decode([Tag].self, from: response.data)
            print(tags)
            
            return tags
        } catch {
            print(error)
            return []
        }
    }
    
    func fetchIngredients() async -> [Ingredient] {
        do {
            let response = try await supabase
                .from("Ingredients")
                .select("*")
                .execute()
            
            print("#### Fetching Ingredients from Supabase ####")
            print("Status: \(response.status)")
            print("Fetched: \(response.data)")
            
            let ingredients = try JSONDecoder().decode([Ingredient].self, from: response.data)
            print(ingredients)
            
            return ingredients
        } catch {
            print(error)
            return []
        }
    }
    
    func fetchCategories() async -> [Category] {
        do {
            let response = try await supabase
                .from("Categories")
                .select("*")
                .execute()
            
            print("#### Fetching Categories from Supabase ####")
            print("Status: \(response.status)")
            print("Fetched: \(response.data)")
            
            let categories = try JSONDecoder().decode([Category].self, from: response.data)
            print(categories)
            
            return categories
        } catch {
            print(error)
            return []
        }
    }
}
