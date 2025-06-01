//
//  RecipeCard.swift
//  IngrediScan
//
//  Created by Faramir on 07.05.25.
//

import SwiftUI

struct RecipeCard: View {
    @State private var isSummaryShown: Bool = false
    
    @Binding var recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topLeading) {
                Image(self.recipe.imageUrl)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .overlay(Color.black.opacity(0.2))
                
                Button {
                    self.recipe.isFavorite.toggle()
                } label: {
                    Image(systemName: self.recipe.isFavorite ? "bookmark.fill" : "bookmark")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .foregroundStyle(.yellow)
                        .padding(20)
                }
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
            
            TagList(tags: self.recipe.tags)
        }
        .background(Color(uiColor: UIColor.secondarySystemBackground))
        .cornerRadius(20)
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color(uiColor: UIColor.secondarySystemFill), lineWidth: 1)
        }
        .onTapGesture {
            self.isSummaryShown.toggle()
        }
        .sheet(isPresented: $isSummaryShown) {
            RecipeSummaryView(recipe: self.$recipe)
                .presentationDragIndicator(.visible)
                .presentationCornerRadius(20)
                .presentationBackgroundInteraction(.enabled)
                .presentationDetents([.fraction(0.22),.fraction(0.75)])
                .padding(.horizontal)
                .edgesIgnoringSafeArea(.bottom)
        }
        .padding()
        .shadow(radius: 5)
    }
}

#Preview {
    RecipeCard(recipe: .constant(RecipeViewModel().recipes[2]))
}
