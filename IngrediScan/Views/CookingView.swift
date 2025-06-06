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
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    ZStack(alignment: .top) {
                        RecipeImage(recipe: $recipe)
                        GeometryReader { geometry in
                            HStack {
                                DismissButton()
                                    .frame(width: geometry.size.width * 0.25)
                                Text("Kochen")
                                    .font(.title .bold() .smallCaps())
                                    .frame(width: geometry.size.width * 0.5)
                                Spacer()
                                    .frame(width: geometry.size.width * 0.25)
                            }
                            .foregroundStyle(.white)
                        }
                    }
                    IngredientList(recipe: recipe)
                        .padding()
                    
                    Divider()
                        .padding(.bottom)
                    
                    StepTimeline(items: $recipe.steps)
                }
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        VStack {
                            Divider()
                            Button("Fertig") {
                                dismiss()
                            }
                            .buttonStyle(.borderedProminent)
                            .padding(.top)
                        }
                    }
                }
                .toolbarBackgroundVisibility(.hidden, for: .bottomBar)
            }
            .background(.clear)
            .cornerRadius(16)
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    CookingView(recipe: .constant(RecipeViewModel().recipes[0]))
}
