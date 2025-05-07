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
        NavigationView {
            CategoryList(categories: [PizzaCategoryMock(), BurgerCategoryMock()])
            
                .searchable(text: $searchText)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Recipes")
                            .font(.title .bold() .smallCaps())
                    }
                }
        }
    }
}

#Preview {
    OverviewScreen()
}
