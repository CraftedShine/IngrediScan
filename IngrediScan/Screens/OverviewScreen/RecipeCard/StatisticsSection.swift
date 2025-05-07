//
//  StatisticsSection.swift
//  IngrediScan
//
//  Created by Faramir on 07.05.25.
//

import SwiftUI

struct StatisticsSection: View {
    let recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Statistics")
                .font(.subheadline .smallCaps() .bold())
                .foregroundColor(.gray)
            // Working Time
            HStack(alignment: .top) {
                Text("Arbeitszeit:")
                    .font(.callout .bold())
                Text("ca. 15 Minuten")
            }
            HStack() {
                Text("Schwierigkeitsgrad:")
                    .font(.callout .bold())
                Text("einfach")
            }
            HStack() {
                Text("kcal pro Portion:")
                    .font(.callout .bold())
                Text("ca. 3489 kcal")
            }
            Divider()
                .padding(.vertical)
        }
    }
}

#Preview {
    StatisticsSection(recipe: PizzaMock())
}
