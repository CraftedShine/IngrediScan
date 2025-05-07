//
//  RecipeListView.swift
//  IngrediScan
//
//  Created by Fynn Schotten on 25.04.25.
//

import SwiftUI

struct RecipeListView: View {
    @Environment(\.dismiss) var dismiss
    @State private var searchText: String = ""
    @Binding var showRecipes: Bool
    
    private var category: Category
    private var recipes: [Recipe] = []
    
    public init (category: Category, showRecipes: Binding<Bool>) {
        self.category = category
        self.recipes = category.recipes
        _showRecipes = showRecipes
    }
    
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ForEach(recipes) { recipe in
                        RecipeCard(recipe: recipe)
                    }
                }
            }
            .searchable(text: $searchText)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(self.category.name)
                        .font(.title .bold() .smallCaps())
                }
                ToolbarItem (placement: .topBarTrailing){
                    Button {
                        showRecipes.toggle()
                    } label: {
                            Image(systemName: "xmark.circle")
                            .foregroundStyle(Color.primary)
                    }
                }
            }
        }
    }
}

#Preview {
    RecipeListView(category: PizzaCategoryMock(), showRecipes: .constant(true))
}
