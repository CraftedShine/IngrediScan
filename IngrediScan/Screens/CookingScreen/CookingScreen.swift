//
//  CookingScreen.swift
//  IngrediScan
//
//  Created by Faramir on 26.04.25.
//

import SwiftUI

struct CookingScreen: View {
    var body: some View {
        CookingView(recipe: Recipe(name: "Pizza", image: "pizza"))
    }
}

#Preview {
    CookingScreen()
}
