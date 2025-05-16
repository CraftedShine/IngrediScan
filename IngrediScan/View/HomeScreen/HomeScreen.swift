//
//  OverviewScreen.swift
//  IngrediScan
//
//  Created by Faramir on 25.04.25.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText: String = ""
    @State private var viewModel = AppDataViewModel()
    
    var body: some View {
        NavigationView {
            RecipeListView(searchText: $searchText, viewModel: $viewModel)
                .navigationBarTitleDisplayMode(.inline)
                .searchable(text: $searchText)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Text("Recipes")
                            .font(.title .bold() .smallCaps())
                    }
                }
        }
    }
}

#Preview {
    HomeView()
}
