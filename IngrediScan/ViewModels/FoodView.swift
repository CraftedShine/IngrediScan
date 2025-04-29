//
//  FoodView.swift
//  IngrediScan
//
//  Created by Faramir on 27.04.25.
//

import SwiftUI

struct FoodView: View {
    var body: some View {
        Image("pizza")
            .resizable()
            .scaledToFill()
            .frame(height: 250)
            .clipped()
            .overlay(
                Text("Pizza")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .shadow(color: Color.black, radius: 10, x: 0, y: 2)
            )
            .cornerRadius(15)
            .padding()
    }
}

#Preview {
    FoodView()
}
