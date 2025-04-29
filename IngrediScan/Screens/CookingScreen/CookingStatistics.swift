//
//  CookingStatistics.swift
//  IngrediScan
//
//  Created by Faramir on 29.04.25.
//

import SwiftUI

struct CookingStatistics: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Miscellaneous")
                .font(.subheadline .smallCaps() .bold())
                .foregroundColor(.gray)
            // Working Time
            HStack(alignment: .top) {
                Text("Arbeitszeit:")
                    .font(.callout .bold())
                Text("ca. 15 Minuten")
            }
            HStack() {
                Text("Ruhezeit:")
                    .font(.callout .bold())
                Text("ca. 2 Tage 30min")
            }
            HStack() {
                Text("Gesamtzeit:")
                    .font(.callout .bold())
                Text("ca. 2 Tage 45min")
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
                .padding(.top)
        }
        .padding()
    }
}

#Preview {
    CookingStatistics()
}
