//
//  FilterOptionsView.swift
//  IngrediScan
//
//  Created by Jan Keller on 21.05.25.
//

import SwiftUI

struct FilterOptionsView: View {
    
    @Binding var selectedFilters: Set<String>
    let filterOptions = ["Kochzeit", "Schwierigkeit", "Kalorien", "Zutatenanzahl"]
    
    var body: some View {
        VStack(spacing: 15) {
            Text("Sortieren nach")
                .font(.headline)

            ForEach(filterOptions, id: \.self) { option in
                Button(action: {
                    if selectedFilters.contains(option) {
                        selectedFilters.remove(option)
                    } else {
                        selectedFilters.insert(option)
                    }
                }) {
                    HStack {
                        Text(option)
                            .font(.body)
                            .foregroundColor(.primary)
                        Spacer()
                        Image(systemName: selectedFilters.contains(option) ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(selectedFilters.contains(option) ? .blue : .gray)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 2))
                }
            }
        }
        .padding(.horizontal, 20)
    }
}
