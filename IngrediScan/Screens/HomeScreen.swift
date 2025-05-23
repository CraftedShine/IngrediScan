//
//  OverviewScreen.swift
//  IngrediScan
//
//  Created by Faramir on 25.04.25.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText: String = ""
    @StateObject var viewModel: AppDataViewModel
    @StateObject var recipeViewModel: RecipeViewModel
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                HStack {
                    
                }
                RecipeListView(searchText: $searchText, recipeViewModel: recipeViewModel, viewModel: viewModel)
                    .navigationBarTitleDisplayMode(.inline)
                    .searchable(text: $searchText)
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Text("Rezepte")
                                .font(.title .bold() .smallCaps())
                        }
                    }
                    .toolbarBackground(Color(UIColor.secondarySystemBackground), for: .navigationBar)
                    .toolbarBackground(.visible, for: .navigationBar)
            }
        }
    }
}

#Preview {
    HomeView(viewModel: AppDataViewModel(), recipeViewModel: RecipeViewModel())
}
