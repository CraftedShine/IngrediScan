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
    var color: Color
    var image: String?
    var action: () -> Void
    
    init(color: Color, image: String, action: @escaping () -> Void) {
        self.color = color
        self.image = image
        self.action = action
    }
    
    var body: some View {
        Button(action: action){
            if let imageName = image {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .padding(20)
                    .foregroundStyle(.white)
            }
        }
        .background(color)
        .clipShape(Circle())
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

#Preview {
    CircularButton(color: .orange, image: "play.fill") {
        print("Test")
    }
    
    RoundedRectangularButton(title: "Test", color: .orange) {
        print("Test")
    }
}
