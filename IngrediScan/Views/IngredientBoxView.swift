//
//  IngredientBox.swift
//  IngrediScan
//
//  Created by Jan Keller on 14.05.25.
//

import SwiftUI

struct IngredientBoxView: View {
    let ingredient: Ingredient
    @Binding var isEditing: Bool
    let onDelete: () -> Void
    @State private var rotationAngle: Double = -4
    @State private var scaleEffect: CGFloat = 1.0

    var body: some View {
        ZStack {
            VStack {
                Text(ingredient.name)
                    .font(.headline)
                    .padding()
            }
            .frame(width: 100, height: 100)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 5)
            .scaleEffect(scaleEffect)
            .rotationEffect(isEditing ? .degrees(rotationAngle) : .zero)
            .animation(isEditing ? Animation.easeInOut(duration: 0.2).repeatForever(autoreverses: true) : .default, value: isEditing)
            .onAppear {
                if isEditing {
                    withAnimation {
                        rotationAngle = 50
                        scaleEffect = 1.05
                    }
                }
            }
            .onLongPressGesture {
                withAnimation {
                    isEditing.toggle()
                }
            }
            
            if isEditing {
                Button(action: { onDelete() }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.red)
                        .padding(5)
                }
                .offset(x: 40, y: -40)
            }
        }
    }
}


