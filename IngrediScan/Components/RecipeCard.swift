//
//  MinimalRecipeCard.swift
//  IngrediScan
//
//  Created by Faramir on 09.05.25.
//

import SwiftUI

struct CardTagList: View {
    var hasTags: [TagRelation]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(hasTags, id: \.id) { tagRelation in
                    Button {
                        
                    } label: {
                        Text(tagRelation.Tag.name)
                    }
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

struct CardBackground: View {
    @Binding var recipe: Recipe
    
    var body: some View {
        Image(self.recipe.imageUrl!)
            .resizable()
            .scaledToFit()
            .aspectRatio(contentMode: .fill)
            .frame(height: 150)
            .clipped()
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundStyle(.black.opacity(0.4))
            }
    }
}

struct CardText: View {
    @Binding var recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            //MARK: Title Bar
            HStack(spacing: 0) {
                Text(self.recipe.name)
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                ToggleFavoriteButton(recipe: $recipe)
            }
            
            //MARK: Bottom Bar Information
            HStack {
                if let category = recipe.category {
                    HStack(spacing: 16) {
                        Text(category.name)
                            .font(.subheadline .bold() .smallCaps())
                            .foregroundStyle(.white.opacity(0.8))
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)
                            Text(String(self.recipe.rating!))
                                .font(.subheadline .bold())
                                .foregroundStyle(.white)
                        }
                        HStack {
                            Image(systemName: "clock")
                                .foregroundStyle(.white)
                            Text(String(self.recipe.duration!) + "min")
                                .font(.subheadline .bold())
                                .foregroundStyle(.white)
                        }
                        HStack {
                           Image(systemName: "chart.bar.xaxis.ascending")
                                .foregroundStyle(.white)
                            Text(self.recipe.difficulty!)
                                .font(.subheadline .bold())
                                .foregroundStyle(.white)
                        }
                    }
                }
            }
        }
    }
}

struct RecipeCard: View {
    @Binding var recipe: Recipe
    @State var detailedView: Bool = false
    
    var body: some View {
        ZStack(alignment: .trailing) {
            
            Button {
                detailedView.toggle()
            } label: {
                ZStack(alignment: .leading) {
                    CardBackground(recipe: $recipe)
                    CardText(recipe: $recipe)
                        .padding(.leading)
                }
            }
            .cornerRadius(20)
            .fullScreenCover(isPresented: $detailedView) {
                RecipeDetailView(recipe: self.$recipe)
            }
        }
        .padding()
    }
}

#Preview {
    RecipeCard(recipe: .constant(Recipe.caesarSalad))
}
