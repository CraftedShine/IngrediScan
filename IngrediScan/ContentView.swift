//
//  ContentView.swift
//  IngrediScan
//
//  Created by Fynn Schotten on 25.04.25.
//

import SwiftUI

struct ContentView: View {
    private let recipes: [Recipe] = [BurgerMock(), PizzaMock()]
    @State private var selectedTab: Int = 0
    
    var body: some View {
        TabView {
            OverviewScreen()
                .tabItem{
                    Label("Home", systemImage: "house.fill")
                }.tag(0)
            IngredientsScreen()
                .tabItem
                {
                    Label("Ingredients", systemImage: "cart.fill")
                }.tag(1)
            CookingScreen(recipe: BurgerMock())
                .tabItem {
                    Label("Cooking", systemImage: "frying.pan.fill")
                }.tag(2)
            FridgeScreen()
                .tabItem{
                    Label("My Fridge", systemImage: "storefront.fill")
                }.tag(3)
        }
        .onAppear{ selectedTab = 0 }
        .statusBar(hidden: false)
    }
}

#Preview {
    ContentView()
}
