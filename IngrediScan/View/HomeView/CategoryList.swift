//
//  CategoryList.swift
//  IngrediScan
//
//  Created by Faramir on 07.05.25.
//

import SwiftUI

struct CategoryList: View {
    private var categories: [Category] = []
    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 300))
    ]
    
    public init(categories: [Category]) {
        self.categories = categories
    }
    
    var body: some View {
        
            ScrollView {
                Grid( horizontalSpacing: 8, verticalSpacing: 20) {
                    ForEach(categories) { category in
                        GridRow {
                            CategoryCard(category: category)
                        }
                    }
                }
        }
    }
}

#Preview {
    CategoryList(categories: [PizzaCategoryMock()])
}
