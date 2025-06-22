//
//  RecipeImage.swift
//  IngrediScan
//
//  Created by Faramir on 24.05.25.
//
import SwiftUI

struct RecipeImage : View {
    @Binding var recipe: Recipe
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack {
                AsyncImage(url: URL(string: recipe.imageUrl)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaledToFit()
                            .overlay(Color.black.opacity(0.3))
                    case .failure(_):
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaledToFit()
                            .overlay(Color.black.opacity(0.3))
                    @unknown default:
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaledToFit()
                            .overlay(Color.black.opacity(0.3))
                    }
                }
                
                
                Text(recipe.name)
                    .font(.largeTitle .bold() .smallCaps())
                    .lineLimit(1)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding()
            }
        }
    }
}

#Preview {
    RecipeImage(recipe: .constant(ViewModel().recipes[0]))
}
