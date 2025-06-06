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
    @State private var rotationAngle: Double = 0
    
    var body: some View {
        ZStack {
            
            Text(ingredient.name)
                .font(.headline)
                .padding()
            
                .frame(width: 100, height: 100)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 5)
                .rotationEffect(.degrees(rotationAngle))
                .onChange(of: isEditing) {
                    if isEditing {
                        startWobbleAnimation()
                    }
                }
                .onLongPressGesture {
                    isEditing.toggle()
                }
            
            if isEditing {
                Button(action: { onDelete() }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.red)
                        .scaleEffect(1.4)
                        .padding(5)
                }
                .offset(x: 37, y: -37)
            }
        }
    }
    
    
    private func startWobbleAnimation() {
        Task {
            while isEditing {
                await MainActor.run {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                        rotationAngle = rotationAngle == 6 ? -6 : 6
                    }
                }
                try? await Task.sleep(nanoseconds: 120_000_000)
            }
            rotationAngle = 0
        }
    }
}


struct IngredientBoxView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientBoxPreviewWrapper()
    }
}

struct IngredientBoxPreviewWrapper: View {
    @State private var isEditing = false
    
    var body: some View {
        VStack {
            IngredientBoxView(
                ingredient: MockIngredients().ingredients.first!,
                isEditing: $isEditing,
                onDelete: { }
            )
            .previewLayout(.sizeThatFits)
            .padding()
        }
    }
}





