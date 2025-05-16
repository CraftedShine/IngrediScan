//
//  TimelineView.swift
//  IngrediScan
//
//  Created by Faramir on 07.05.25.
//

import SwiftUI

struct TimelineView: View {
    @State var recipe: Recipe
    
    @State private var items: [RecipeStep]
    
    init(recipe: Recipe) {
        self.recipe = recipe
        self.items = recipe.steps
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(items.indices, id: \.self) { index in
                    HStack(alignment: .top) {
                        VStack {
                            Button(action: {
                                items[index].isDone.toggle()
                                
                                if items[index].isDone {
                                    // Check all previous Steps
                                    for i in 0...index {
                                        items[i].isDone = true
                                    }
                                } else {
                                    // Uncheck all following Steps
                                    for i in index...items.count-1 {
                                        items[i].isDone = false
                                    }
                                }
                            }) {
                                ZStack {
                                    Circle()
                                        .fill(items[index].isDone ? Color.blue : Color.clear)
                                        .frame(width: 24, height: 24)
                                        .overlay(
                                            Circle()
                                                .stroke(Color.blue, lineWidth: 2)
                                        )
                                    
                                    if items[index].isDone {
                                        Image(systemName: "checkmark")
                                            .foregroundColor(.white)
                                            .padding(2)
                                    }
                                }
                            }
                            .buttonStyle(PlainButtonStyle()) // Entfernt Standardanimationen
                            
                            // Linie nach unten (außer letzter Eintrag)
                            if index < items.count - 1 {
                                Rectangle()
                                    .fill(index < 2 ? Color.blue : Color.gray)
                                    .frame(width: 2, height: 40)
                            }
                        }
                        
                        VStack(alignment: .leading) {
                            Text(items[index].title)
                                .padding(.leading, 8)
                                .font(.headline .bold() .smallCaps())
                                .foregroundColor(.primary)
                            Text("\(items[index].description) (\(items[index].duration))")
                                .padding(.leading, 8)
                                .font(.subheadline .bold())
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    TimelineView(recipe: AppDataViewModel().recipes[0])
}
