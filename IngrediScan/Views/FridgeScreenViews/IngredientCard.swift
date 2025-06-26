//
//  IngredientBox.swift
//  IngrediScan
//
//  Created by Jan Keller on 14.05.25.
//

import SwiftUI
import SDWebImageSwiftUI

fileprivate struct IngredientImagePlaceholder: View {
    var body: some View {
        Image(systemName: "photo")
            .resizable()
            .scaledToFit()
            .aspectRatio(contentMode: .fill)
            .clipped()
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundStyle(.black.opacity(0.4))
            }
    }
}

struct IngredientCard: View {
    @EnvironmentObject private var viewModel: ViewModel
    @State private var rotationAngle: Double = 0
    @Binding var isEditing: Bool
    let ingredient: IngredientInFridge
    let onDelete: () -> Void
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            HStack {
                if let icon = ingredient.icon {
                    Text(icon)
                        .padding(8)
                        .background(.gray)
                        .clipShape(Circle())
                        .padding(.trailing)
                }
                
                Text(ingredient.name)
                    .font(.headline .smallCaps() .bold())
                
                Text(String(ingredient.amount))
                    .font(.subheadline .bold())
                    .foregroundStyle(.secondary)
                
                Text(ingredient.Unit.name)
                    .font(.subheadline .bold())
                    .foregroundStyle(.secondary)
                
                Spacer()
            }
            .onChange(of: isEditing) {
                if isEditing {
                    startWobbleAnimation()
                }
            }
            .onLongPressGesture {
                isEditing.toggle()
            }
            .padding()
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(16)
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
            
            if isEditing {
                CircularButton(size: 10, padding: 10, color: .red, image: "xmark") {
                    onDelete()
                }
            }
        }
        .rotationEffect(.degrees(rotationAngle))
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

#Preview {
    @Previewable @State var isEditing = false
    let ingredient = MockIngredients().ingredients.first!
    let ingredientInFridge: IngredientInFridge = .init(id: ingredient.id, name: ingredient.name, amount: 1, icon: "🥚", Unit: Unit(id: 1, name: "Stk"))
    
    VStack {
        IngredientCard(
            isEditing: $isEditing,
            ingredient: ingredientInFridge,
            onDelete: {}
        )
    }
    .withPreviewEnvironmentObjects()
}
