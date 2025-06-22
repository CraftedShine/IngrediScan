//
//  ContentView.swift
//  IngrediScan
//
//  Created by Fynn Schotten on 25.04.25.
//

import SwiftUI
import Supabase

struct MainView: View {
    @State private var selectedTab: Int = 0
    private var fridge = MyFridge()
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(0)
            SearchScreen()
                .tabItem
            {
                Label("Suche", systemImage: "magnifyingglass")
            }.tag(1)
            ShoppingListScreen()
                .tabItem {
                    Label("Einkaufsliste", systemImage: "cart.fill")
                }
                .tag(2)
            FavoritesScreen()
                .tabItem {
                    Label("Favoriten", systemImage: "star.fill")
                }.tag(3)
            FridgeScreen()
                .tabItem {
                    Label("Kühlschrank", systemImage: "storefront.fill")
                }.tag(4)
        }
        .toolbarBackground(Color(UIColor.secondarySystemBackground), for: .tabBar)
        .toolbarBackground(.visible, for: .tabBar)
        .statusBar(hidden: false)
    }
}

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel
    @State private var showLoadingScreen: Bool = true
    
    var body: some View {
        ZStack {
            if !showLoadingScreen && !viewModel.recipes.isEmpty {
                MainView()
            } else {
                AppLoadingScreen()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    showLoadingScreen = false
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .withPreviewEnvironmentObjects()
}

extension View {
    func withPreviewEnvironmentObjects() -> some View {
        self
            .environmentObject(ViewModel())
            .environmentObject(CookingViewModel())
            .environmentObject(TimerViewModel())
            .environmentObject(ShoppingListViewModel())
    }
}
