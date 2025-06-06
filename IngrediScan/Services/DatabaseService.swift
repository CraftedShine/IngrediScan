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
    
    func loadRecipes() async throws -> [Recipe] {
        return try await supabase
            .from("Recipes")
            .select("""
            *,
            category:Categories!Recipes_category_fkey(*),
            usesIngredients(*, ingredient(*), unit(*)),
            hasSteps(*, RecipeStep(*)),
            hasTags(*, Tags(*))
            """)
            .execute()
            .value
    }
    
    func loadTags() async -> [Tag] {
        do {
            let result: [Tag] = try await supabase
                .from("Tags")
                .select("*")
                .execute()
                .value
            
            return result
        } catch {
            print(error)
            return []
        }
    }
}
