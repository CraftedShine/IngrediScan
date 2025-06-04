//
//  ContentView.swift
//  IngrediScan
//
//  Created by Fynn Schotten on 25.04.25.
//

import SwiftUI
import Supabase

struct ContentView: View {
    @State private var viewModel = AppDataViewModel()
    @State private var recipeViewModel = RecipeViewModel()
    @State var units: [Unit] = []
    
    let supabase = SupabaseClient(
        supabaseURL: URL(string: "https://zglesyibcbwjoalbzdjp.supabase.co")!,
        supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpnbGVzeWliY2J3am9hbGJ6ZGpwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDczNzgxMzcsImV4cCI6MjA2Mjk1NDEzN30.zYi1Bxd8I0mbQfrW2WPya53fWsVqk8EdTTtbzqLZt5Q"
    )
    
    var body: some View {
        TabView(selection: $viewModel.selectedTab) {
            HomeView(viewModel: recipeViewModel)
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
        .task {
            do {
                units = try await supabase.from("Units").select().execute().value
                
                print(units)
            } catch {
                debugPrint(error)
            }
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
