//
//  ContentView.swift
//  IngrediScan
//
//  Created by Fynn Schotten on 25.04.25.
//

import SwiftUI
import Supabase

struct ContentView: View {
    @State private var selectedTab: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
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
            FavoritesScreen()
                .tabItem {
                    Label("Favorites", systemImage: "star.fill")
                }.tag(2)
            FridgeScreen()
                .tabItem{
                    Label("My Fridge", systemImage: "storefront.fill")
                }.tag(3)
        }
        .toolbarBackground(Color(UIColor.secondarySystemBackground), for: .tabBar)
        .toolbarBackground(.visible, for: .tabBar)
        .statusBar(hidden: false)
    }
}

#Preview {
    ContentView()
        .environmentObject(ViewModel())
}
