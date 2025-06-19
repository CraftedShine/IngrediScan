//
//  ToggleFavoriteButton.swift
//  IngrediScan
//
//  Created by Faramir on 24.05.25.
//

import SwiftUI

struct ToggleFavoriteButton: View {
    @EnvironmentObject var viewModel: ViewModel
    @Binding var recipe: Recipe
    
    var body: some View {
        Button {
            viewModel.toggleFavorite(for: recipe)
        } label: {
            Image(systemName: self.viewModel.isFavorite(self.recipe) ? "star.fill" : "star")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundColor(self.viewModel.isFavorite(self.recipe) ? .yellow : .white)
                .padding(10)
                .background(Color.black.opacity(0.5))
                .clipShape(Circle())
        }
        .padding(30)
    }
}

#Preview {
    ToggleFavoriteButton(recipe: .constant(Recipe.caesarSalad))
        .environmentObject(ViewModel())
}
