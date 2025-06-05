//
//  RecipeViewModel.swift
//  IngrediScan
//
//  Created by Faramir on 21.05.25.
//

import Foundation
import SwiftUI
import Supabase

@MainActor
class RecipeViewModel: ObservableObject {
    let supabase: SupabaseClient = SupabaseClient(
        supabaseURL: URL(string: "https://zglesyibcbwjoalbzdjp.supabase.co")!,
        supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpnbGVzeWliY2J3am9hbGJ6ZGpwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDczNzgxMzcsImV4cCI6MjA2Mjk1NDEzN30.zYi1Bxd8I0mbQfrW2WPya53fWsVqk8EdTTtbzqLZt5Q"
    )
    @Published var recipes: [Recipe] = []
    @Published var categories: [Category] = []
    @Published var tags: [Tag] = [Tag(id: 1, name: "Italienisch"), Tag(id: 2, name: "Spanisch"), Tag(id: 3, name: "Französisch"), Tag(id: 4, name: "Türkisch"), Tag(id: 5, name: "Einfach")]
    
    init() {}
    
    func loadRecipes() async {
        #if targetEnvironment(simulator)
        self.recipes = MockData().recipes
        #else
        do {
            let response: [Recipe] = try await supabase
                .from("Recipes")
                .select("""
                    *,
                    Categories(*),
                    usesIngredients(*, Ingredients(*), Units(*)),
                    hasSteps(*, RecipeStep(*)),
                    hasTags(*, Tags(*))
                """)
                .execute()
                .value
            self.recipes = response
        } catch {
            print("Error while trying to fetch Recipes: \(error)")
        }
        #endif
    }
}
