//
//  RecipeSummaryView.swift
//  IngrediScan
//
//  Created by Faramir on 22.05.25.
//

import SwiftUI

struct RecipeSummaryView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var recipe: Recipe
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    CookingStatistics(recipe: self.recipe)
                        .padding()
                    
                    IngredientList(recipe: self.recipe)
                        .padding()
                    
                    
                    VStack(alignment: .leading) {
                        Text("Tags")
                            .font(.callout .bold() .smallCaps())
                            .foregroundStyle(.secondary)
                            .padding(.leading)
                        TagList(tags: self.recipe.tags)
                    }
                    .padding(.top)
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text(self.recipe.name)
                        .font(.title .bold() .smallCaps())
                        .padding(.top)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "x.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .foregroundStyle(Color(uiColor: UIColor.systemGray))
                            .padding([.top, .leading])
                    }
                }
            }
        }
    }
}

#Preview {
    RecipeSummaryView(recipe: .constant(RecipeViewModel().recipes[4]))
}
