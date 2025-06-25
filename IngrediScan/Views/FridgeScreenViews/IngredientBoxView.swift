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

struct IngredientBoxView: View {
    @EnvironmentObject private var viewModel: ViewModel
    @State private var rotationAngle: Double = 0
    @Binding var isEditing: Bool
    let ingredient: IngredientInFridge
    let onDelete: () -> Void
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack {
                if let ingredientDb = self.viewModel.ingredients.first(where: { $0.id == ingredient.id }) {
                    WebImage(url: URL(string: ingredientDb.imageUrl)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(contentMode: .fill)
                            .clipped()
                            .overlay {
                                RoundedRectangle(cornerRadius: 16)
                                    .foregroundStyle(.black.opacity(0.4))
                            }
                    } placeholder: {
                        IngredientImagePlaceholder()
                    }
                    .indicator(.activity)
                    .transition(.fade(duration: 0.5))
                }
                
                VStack{
                    Text(ingredient.name)
                        .font(.title2 .smallCaps() .bold())
                        .foregroundStyle(.white)
                    
                    HStack{
                        Text(String(format: "%.0f", ingredient.amount))
                            .font(.headline .bold())
                            .foregroundColor(.white.opacity(0.8))
                        
                        Text(ingredient.Unit.name)
                            .font(.headline .bold())
                            .foregroundColor(.white.opacity(0.8))
                    }
                }
            }
            .frame(width: 170, height: 100)
            .background(Color(UIColor.secondarySystemBackground))
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
                CircularButton(size: 10, padding: 10, color: .red, image: "xmark") {
                    onDelete()
                }
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

#Preview {
    @Previewable @State var isEditing = false
    let ingredient = MockIngredients().ingredients.first!
    let ingredientInFridge: IngredientInFridge = .init(id: ingredient.id, name: ingredient.name, amount: 1, Unit: Unit(id: 1, name: "Stk"))
                                        
    IngredientBoxView(
        isEditing: $isEditing,
        ingredient: ingredientInFridge,
        onDelete: {}
    )
    .withPreviewEnvironmentObjects()
}
