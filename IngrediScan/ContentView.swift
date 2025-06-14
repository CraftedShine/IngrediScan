//
//  ContentView.swift
//  IngrediScan
//
//  Created by Fynn Schotten on 25.04.25.
//

import SwiftUI
import Supabase
import SwiftData

struct ContentView: View {
    @State private var selectedTab: Int = 0
    @StateObject private var viewModel = ViewModel()
    
    @Environment(\.modelContext) private var modelContext
    private var fridge = MyFridge()

    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView(viewModel: viewModel)
                .tabItem{
                    Label("Home", systemImage: "house.fill")
                }
                .tag(0)
            SearchScreen(viewModel: viewModel, fridge: fridge)
                .tabItem
            {
                Label("Search", systemImage: "magnifyingglass")
            }.tag(1)
            FavoritesScreen(viewModel: viewModel)
                .tabItem {
                    Label("Favorites", systemImage: "star.fill")
                }.tag(2)
            FridgeScreen(fridge: fridge)
                .tabItem{
                    Label("My Fridge", systemImage: "storefront.fill")
                }.tag(3)
        }
        .toolbarBackground(Color(UIColor.secondarySystemBackground), for: .tabBar)
        .toolbarBackground(.visible, for: .tabBar)
        .statusBar(hidden: false)
        .onAppear {
            modelContext.insert(fridge)
            try? modelContext.save()
        }
    }
}

#Preview {
    ContentView()
}
