//
//  OverviewScreen.swift
//  IngrediScan
//
//  Created by Faramir on 25.04.25.
//

import SwiftUI

struct OverviewScreen: View {
    @State private var searchText: String = ""

    var body: some View {
        VStack (alignment: .center, spacing: 0) {
            Text("Recipes")
                .font(.largeTitle .bold())
            NavigationView {
                RecipeListView(recipes: [PizzaMock(), BurgerMock(), BurgerMock(), PizzaMock()])
            }
            .searchable(text: $searchText)
        }
    }
}

#Preview {
    OverviewScreen()
}
