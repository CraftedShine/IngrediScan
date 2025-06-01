//
//  CookingView.swift
//  IngrediScan
//
//  Created by Faramir on 24.05.25.
//

import SwiftUI

struct CookingView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var recipe: Recipe
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                VStack {
                    VStack(alignment: .leading, spacing: 0) {
                        RecipeImage(recipe: $recipe)
                        IngredientList(recipe: recipe)
                            .padding()
                        StepTimeline(items: $recipe.steps)
                    }
                    
                    Button("Fertig") {
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.bottom)
                }
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(20)
                .padding()
                .shadow(radius: 5)
                
                DismissButton()
            }
        }
        .scrollIndicators(.hidden)
        .background(.clear)
    }
}

#Preview {
    CookingView(recipe: .constant(RecipeViewModel().recipes[7]))
}
