//
//  IngredientBox.swift
//  IngrediScan
//
//  Created by Jan Keller on 14.05.25.
//

import SwiftUI
import SDWebImageSwiftUI

struct IngredientCard: View {
    @EnvironmentObject private var viewModel: ViewModel
    @EnvironmentObject private var fridgeViewModel: FridgeViewModel
    @State private var rotationAngle: Double = 0
    @Binding var item: FridgeItem
    @Binding var isEditing: Bool
    
    var body: some View {
        if let ingredient = viewModel.getIngredient(item.ingredientId) {
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
                    
                    Text(String(item.amount))
                        .font(.subheadline .bold())
                        .foregroundStyle(.secondary)
                    
                    Text(ingredient.unit.name)
                        .font(.subheadline .bold())
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                }
                .onChange(of: isEditing) {
                    if isEditing {
                        startWobbleAnimation()
                    }
                }
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(16)
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
                .onLongPressGesture(minimumDuration: 0.2) {
                    isEditing.toggle()
                }
                
                if isEditing {
                    CircularButton(size: 10, padding: 10, color: .red, image: "xmark") {
                        fridgeViewModel.deleteItem(item)
                    }
                }
            }
            .rotationEffect(.degrees(rotationAngle))
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

#Preview {
    VStack {
        IngredientCard(item: .constant(FridgeItem(ingredientId: 9, amount: 100)), isEditing: .constant(true))
    }
    .withPreviewEnvironmentObjects()
}
