//
//  RecipeListView.swift
//  IngrediScan
//
//  Created by Fynn Schotten on 25.04.25.
//

import SwiftUI

struct RecipeListView: View {
    @Binding var searchText: String
    @Binding var viewModel: AppDataViewModel
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                ScrollView(.horizontal) {
                    HStack {
                        Button("Tag 1") {}
                            .buttonBorderShape(.capsule)
                            .buttonStyle(.borderedProminent)
                        Button("Tag 2") {}
                            .buttonBorderShape(.capsule)
                            .buttonStyle(.borderedProminent)
                        Button("Tag 3") {}
                            .buttonBorderShape(.capsule)
                            .buttonStyle(.borderedProminent)
                        Button("Tag 4") {}
                            .buttonBorderShape(.capsule)
                            .buttonStyle(.borderedProminent)
                        Button("Tag 5") {}
                            .buttonBorderShape(.capsule)
                            .buttonStyle(.borderedProminent)
                        Button("Tag 6") {}
                            .buttonBorderShape(.capsule)
                            .buttonStyle(.borderedProminent)
                    }
                    .padding([.leading, .bottom])
                }
                
                if (searchResults.isEmpty) {
                    Text("No Recipes found")
                        .font(.headline .bold() .smallCaps())
                        .foregroundStyle(.secondary)
                        .padding()
                }
                VStack {
                    ForEach(searchResults) { recipe in
                        RecipeCard(recipe: recipe, viewModel: $viewModel)
                            .padding()
                    }
                }
            }
        }
    }
    
    var searchResults: [Recipe] {
        if searchText.isEmpty {
            return viewModel.recipes
        } else {
            return viewModel.recipes.filter { $0.name.contains(searchText) }
        }
    }
}

#Preview {
    RecipeListView(searchText: .constant(""), viewModel: .constant(AppDataViewModel()))
}
