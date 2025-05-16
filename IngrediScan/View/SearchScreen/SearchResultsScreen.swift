//
//  SearchResultsScreen.swift
//  IngrediScan
//
//  Created by Jan Keller on 15.05.25.
//

import SwiftUI

struct SearchResultsScreen: View {

    var body: some View {
        NavigationView {
            VStack {
                Text("Suchergebnisse werden hier angezeigt")
                    .font(.title)
                    .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Search Results")
            .edgesIgnoringSafeArea(.all)
        }
    }
}



#Preview {
    SearchResultsScreen()
}
