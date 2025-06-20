//
//  SearchResultsScreen.swift
//  IngrediScan
//
//  Created by Jan Keller on 15.05.25.
//

import SwiftUI

struct SearchResultView: View {

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
    SearchResultView()
}
