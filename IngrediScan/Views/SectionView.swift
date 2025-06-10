//
//  SectionView.swift
//  IngrediScan
//
//  Created by Faramir on 10.06.25.
//

import SwiftUI

struct SectionView: View {
    @State var selectedPage: Int = 0
    @Binding var recipes: [Recipe]
    let title: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title3 .bold() .smallCaps())
            TabView(selection: $selectedPage) {
                ForEach($recipes.indices, id: \.self) { index in
                    RecipeCard(recipe: $recipes[index])
                        .tag(index)
                }
            }
            .frame(height: 150)
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            HStack(spacing: 8) {
                ForEach(0..<recipes.count, id: \.self) { index in
                    Button {
                        selectedPage = index
                    } label: {
                        Circle()
                            .fill(index == selectedPage ? Color.white : Color.gray.opacity(0.4))
                            .frame(width: 10, height: 10)
                    }
                    .padding(8)
                }
            }
            .background(.secondary.opacity(0.3))
            .cornerRadius(20)
        }
        .padding(.top)
    }
}

#Preview {
    @Previewable @StateObject var viewModel: ViewModel = ViewModel()
    
    var recipes = viewModel.recipes.shuffled()
    
    SectionView(recipes: .constant(recipes), title: "Empfohlen für dich")
}
