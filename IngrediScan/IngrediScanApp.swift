//
//  IngrediScanApp.swift
//  IngrediScan
//
//  Created by Faramir on 25.04.25.
//

import SwiftUI

@main
struct IngrediScanApp: App {
    @StateObject private var viewModel = ViewModel()
    @StateObject private var timerViewModel = TimerViewModel()
    @StateObject private var cookingViewModel = CookingViewModel()
    @StateObject private var shoppingListViewModel = ShoppingListViewModel()
    @StateObject private var searchViewModel = SearchViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
                .environmentObject(timerViewModel)
                .environmentObject(cookingViewModel)
                .environmentObject(shoppingListViewModel)
                .environmentObject(searchViewModel)
        }
    }
}
