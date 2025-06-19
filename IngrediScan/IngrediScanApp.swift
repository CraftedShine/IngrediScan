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
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
