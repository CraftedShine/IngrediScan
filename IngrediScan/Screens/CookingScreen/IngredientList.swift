//
//  IngredientList.swift
//  IngrediScan
//
//  Created by Faramir on 29.04.25.
//

import SwiftUI

struct IngredientList: View {
    var body: some View {
        GeometryReader { g in
            VStack(alignment: .leading, spacing: 8) {
                Text("Ingredients")
                    .font(.subheadline .smallCaps() .bold())
                    .foregroundColor(.gray)
                    .padding(.leading)
                
                // Ingredients List
                List {
                    HStack {
                        Text("500 ml")
                            .font(.callout .bold())
                        Text("lauwarmes Wasser")
                    }
                    HStack {
                        Text("25 ml")
                            .font(.callout .bold())
                        Text("Olivenöl")
                    }
                    HStack {
                        Text("40 g")
                            .font(.callout .bold())
                        Text("Frischhefe")
                    }
                    HStack {
                        Text("20 g")
                            .font(.callout .bold())
                        Text("Salz")
                    }
                    HStack {
                        Text("1 Prise")
                            .font(.callout .bold())
                        Text("Zucker")
                    }
                    HStack {
                        Text("925 g")
                            .font(.callout .bold())
                        Text("glattes Mehl")
                    }
                }
                .listStyle(.plain)
                .scrollDisabled(true)
                .frame(width: g.size.width - 5, height: g.size.height - 50, alignment: .center)
            }
        }
    }
}

#Preview {
    IngredientList()
}
