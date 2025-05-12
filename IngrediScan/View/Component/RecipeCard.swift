//
//  RecipeCard.swift
//  IngrediScan
//
//  Created by Faramir on 07.05.25.
//

import SwiftUI

struct RecipeCard: View {
    private var recipe: Recipe
    
    public init(recipe: Recipe) {
        self.recipe = recipe
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Button {} label: {
                Image(self.recipe.imageName)
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
    RecipeCard(recipe: BurgerMock())
}
