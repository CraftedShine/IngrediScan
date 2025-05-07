//
//  RecipeView.swift
//  IngrediScan
//
//  Created by Faramir on 25.04.25.
//

import SwiftUI

struct CategoryCard: View {
    @State private var showRecipes = false
    let category: Category
    
    var body: some View {
        Button {
            showRecipes.toggle()
        } label: {
            ZStack(alignment: .center) {
                Image(category.image)
                    .resizable()
                    .frame(width: .infinity)
                    .aspectRatio(contentMode: .fit)
                Text(category.name)
                    .font(.largeTitle .smallCaps() .bold())
                    .foregroundStyle(Color.white)
                    .shadow(color: Color.black, radius: 2, x: 0, y: 2)
            }
            .cornerRadius(15)
            .padding(.horizontal)
        }
        .sheet(isPresented: $showRecipes) {
            RecipeListView(category: self.category, showRecipes: $showRecipes)
                .presentationDragIndicator(.visible)
                .presentationDetents([.fraction((0.999))])
        }
    }
}

#Preview {
    CategoryCard(category: PizzaCategoryMock())
}
