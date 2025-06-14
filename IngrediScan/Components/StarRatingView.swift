//
//  StarRatingView.swift
//  IngrediScan
//
//  Created by Jan Keller on 14.06.25.
//


import SwiftUI

struct StarRatingView: View {
    @Binding var rating: Int
    var maximumRating: Int = 5
    var onColor = Color.yellow
    var offColor = Color.gray
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(1...maximumRating, id: \.self) { number in
                Image(systemName: number <= rating ? "star.fill" : "star")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(number <= rating ? onColor : offColor)
                    .onTapGesture {
                        rating = number
                    }
            }
        }
    }
}