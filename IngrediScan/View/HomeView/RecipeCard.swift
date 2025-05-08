//
//  RecipeCard.swift
//  IngrediScan
//
//  Created by Faramir on 07.05.25.
//

import SwiftUI

struct RecipeCard: View {
    private var recipe: Recipe
    @Binding var selectedRecipe: Recipe
    @Binding var selectedTab: Int
    
    public init(recipe: Recipe, selectedRecipe: Binding<Recipe>, selectedTab: Binding<Int>) {
        self.recipe = recipe
        _selectedRecipe = selectedRecipe
        _selectedTab = selectedTab
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Button {
                selectedRecipe = self.recipe
                selectedTab = 2
            } label: {
                Image(self.recipe.image)
                    .resizable()
                    .frame(width: .infinity)
                    .scaledToFit()
            }
            Text(self.recipe.name)
                .font(.title2 .bold() .smallCaps())
                .padding([.leading, .top])
            HStack {
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                    
                    
                    Text(String(self.recipe.rating))
                }
                Text(self.recipe.category.name)
                    .font(.callout .bold() .smallCaps())
                    .foregroundStyle(.secondary)
            }
            .padding([.leading, .top])
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(self.recipe.tags, id: \.self) { tag in
                        Button {
                            
                        } label: {
                            Text(tag)
                        }
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.capsule)
                    }
                }
            }
            .padding()
            
        }
        .cornerRadius(20)
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.secondary, lineWidth: 1)
        }
    }
}

#Preview {
    RecipeCard(recipe: PizzaMock(), selectedRecipe: .constant(BurgerMock()), selectedTab: .constant(0))
}
