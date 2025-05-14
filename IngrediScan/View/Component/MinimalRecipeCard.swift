//
//  MinimalRecipeCard.swift
//  IngrediScan
//
//  Created by Faramir on 09.05.25.
//

import SwiftUI

struct MinimalRecipeCard: View {
    @State var favorite: Bool = true
    let recipe: Recipe
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            
            
            Image(self.recipe.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 100)
                .clipped()
                .overlay {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundStyle(.black.opacity(0.4))
                }
            
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text(self.recipe.name)
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .lineLimit(1)
                    
                    Button {
                        self.favorite.toggle()
                    } label: {
                        Image(systemName: self.favorite ? "star.fill" : "star")
                            .foregroundStyle(.yellow)
                    }
                }
                HStack {
                    Text(self.recipe.category)
                        .font(.subheadline .bold() .smallCaps())
                        .foregroundStyle(.white.opacity(0.8))
                    Text("⭐ \(String(self.recipe.rating))")
                        .font(.subheadline .bold())
                        .foregroundStyle(.white.opacity(0.8))
                }
            }
            .padding()
        }
        .cornerRadius(16)
        .shadow(radius: 5)
        .padding()
    }
}

#Preview {
    MinimalRecipeCard(recipe: AppDataViewModel().recipes[0])
}
