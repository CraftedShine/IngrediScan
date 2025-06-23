//
//  StylizedButtons.swift
//  IngrediScan
//
//  Created by Faramir on 16.06.25.
//

import SwiftUI

protocol StylizedButton {
    var title: String? { get set }
    var color: Color { get set }
    var image: String? { get set }
    var action: () -> Void { get set }
}

struct CircularButton: View, StylizedButton {
    var title: String? = nil
    var size: CGFloat?
    var padding: CGFloat?
    var contentColor: Color?
    var color: Color
    var image: String?
    var action: () -> Void
    
    init(size: CGFloat? = 20, padding: CGFloat? = 20, color: Color, contentColor: Color? = .white, image: String, action: @escaping () -> Void) {
        self.size = size
        self.padding = padding
        self.color = color
        self.contentColor = contentColor
        self.image = image
        self.action = action
    }
    
    var body: some View {
        Button(action: action){
            if let imageName = image {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: size, height: size)
                    .padding((padding != nil) ? padding! : 0)
                    .foregroundStyle((contentColor != nil) ? contentColor! : .white)
                    .background(color)
                    .clipShape(Circle())
            }
        }
    }
}

struct RoundedRectangularButton: View, StylizedButton {
    var title: String? = nil
    var color: Color
    var image: String? = nil
    var action: () -> Void
    
    init(title: String?, color: Color, action: @escaping () -> Void) {
        self.title = title
        self.color = color
        self.action = action
    }
    
    var body: some View {
        Button(action: action){
            if let text = title {
                Text(text)
                    .foregroundStyle(.white)
                    .font(.headline .bold() .smallCaps())
            }
        }
        .padding()
        .background(color)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct DismissButton: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        CircularButton(size: 20, padding: 10, color: Color.black.opacity(0.5), image: "xmark") {
            dismiss()
        }
        .padding(30)
    }
}

struct ToggleFavoriteButton: View {
    @EnvironmentObject var viewModel: ViewModel
    @Binding var recipe: Recipe
    
    var body: some View {
        CircularButton(size: 20, padding: 10, color: Color.black.opacity(0.5), contentColor: isFavorite ? .yellow : .white, image: isFavorite ? "star.fill" : "star") {
            viewModel.toggleFavorite(for: recipe)
        }
        .padding(30)
    }
    
    var isFavorite: Bool {
        return self.viewModel.isFavorite(self.recipe)
    }
}

#Preview {
    VStack {
        CircularButton(color: .orange, image: "play.fill") {}
        
        DismissButton()
        
        ToggleFavoriteButton(recipe: .constant(Recipe.caesarSalad))
        
        RoundedRectangularButton(title: "Test", color: .orange) {}
    }
    .withPreviewEnvironmentObjects()
}
