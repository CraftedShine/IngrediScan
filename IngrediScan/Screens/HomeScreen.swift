//
//  OverviewScreen.swift
//  IngrediScan
//
//  Created by Faramir on 25.04.25.
//

import SwiftUI

struct HomeView: View {
    @State private var randomRecipeVisible: Bool = false
    @State private var searchText: String = ""
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                ScrollView {
                    VStack {
                        SectionView(recipes: .constant(viewModel.recipes.shuffled()), title: "Empfohlen für dich")
                        SectionView(recipes: .constant(viewModel.recipes.shuffled()), title: "Klassiker")
                        SectionView(recipes: .constant(viewModel.recipes.shuffled()), title: "Vegetarisch")
                    }
                }
                
                Button {
                    randomRecipeVisible.toggle()
                } label: {
                    Image(systemName: "shuffle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .padding(10)
                        .foregroundStyle(.white)
                        .background(Color.orange.opacity(0.75))
                        .clipShape(Circle())
                }
                .sheet(isPresented: $randomRecipeVisible) {
                    RecipeDetailView(recipe: $viewModel.recipes.shuffled().first!)
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("Rezepte")
                            .font(.title .bold() .smallCaps())
                        Divider()
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView(viewModel: ViewModel())
}
