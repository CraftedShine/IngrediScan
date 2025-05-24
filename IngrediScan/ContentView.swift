//
//  ContentView.swift
//  IngrediScan
//
//  Created by Fynn Schotten on 25.04.25.
//

import SwiftUI


struct ContentView: View {
    @State private var viewModel = AppDataViewModel()
    @State private var recipeViewModel = RecipeViewModel()
    
    var body: some View {
        TabView(selection: $viewModel.selectedTab) {
            HomeView(recipeViewModel: recipeViewModel)
                .tabItem{
                    Label("Home", systemImage: "house.fill")
                }
                .tag(0)
            SearchScreen()
                .tabItem
            {
                Label("Search", systemImage: "magnifyingglass")
            }.tag(1)
            FavoritesScreen(viewModel: recipeViewModel)
                .tabItem {
                    Label("Favorites", systemImage: "bookmark")
                }.tag(2)
            FridgeScreen()
                .tabItem{
                    Label("My Fridge", systemImage: "storefront.fill")
                }.tag(3)
        }
        .toolbarBackground(Color(UIColor.secondarySystemBackground), for: .tabBar)
        .toolbarBackground(.visible, for: .tabBar)
        .onAppear {
            viewModel.selectedTab = 0
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor.secondarySystemBackground
            appearance.stackedLayoutAppearance.normal.iconColor = .gray
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.gray]
            
            appearance.stackedLayoutAppearance.selected.iconColor = UIColor(Color.accentColor)
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(Color.accentColor)]
            
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
        .statusBar(hidden: false)
    }
}

#Preview {
    ContentView()
}
