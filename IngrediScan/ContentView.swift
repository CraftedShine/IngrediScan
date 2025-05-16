//
//  ContentView.swift
//  IngrediScan
//
//  Created by Fynn Schotten on 25.04.25.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = AppDataViewModel()
    
    var body: some View {
        TabView(selection: $viewModel.selectedTab) {
            HomeView()
                .tabItem{
                    Label("Home", systemImage: "house.fill")
                }
                .tag(0)
            SearchScreen()
                .tabItem
                {
                    Label("Search", systemImage: "magnifyingglass")
                }.tag(1)
            FavoritesScreen(viewModel: $viewModel)
                .tabItem {
                    Label("Cooking", systemImage: "frying.pan.fill")
                }.tag(2)
            FridgeScreen()
                .tabItem{
                    Label("My Fridge", systemImage: "storefront.fill")
                }.tag(3)
        }
        .onAppear{ viewModel.selectedTab = 0 }
        .statusBar(hidden: false)
    }
}

#Preview {
    ContentView()
}
