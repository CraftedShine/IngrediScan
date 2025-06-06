//
//  TimelineView.swift
//  IngrediScan
//
//  Created by Faramir on 07.05.25.
//

import SwiftUI

struct StepTimeline: View {
    var steps: [StepRelation]
    
    @State private var completedSteps: Set<Int> = []
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Zubereitung")
                .font(.title2)
                .bold()
            
            ForEach(Array(steps.enumerated()), id: \.element.id) { index, stepRelation in
                let step = stepRelation.RecipeStep
                let isCompleted = completedSteps.contains(step.id)
                
                HStack(alignment: .top, spacing: 12) {
                    // Timeline indicator (clickable)
                    VStack {
                        Button(action: {
                            toggleStep(step.id)
                        }) {
                            ZStack {
                                Circle()
                                    .fill(isCompleted ? Color.green : Color.blue)
                                    .frame(width: 20, height: 20)
                                if isCompleted {
                                    Image(systemName: "checkmark")
                                        .font(.system(size: 10))
                                        .foregroundColor(.white)
                                }
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        if index < steps.count - 1 {
                            Rectangle()
                                .fill(Color.blue)
                                .frame(width: 2, height: 40)
                        }
                    }
                    
                    // Step content
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Schritt \(index + 1): \(step.title)")
                            .fontWeight(.semibold)
                            .strikethrough(isCompleted, color: .gray)
                        
                        if let desc = step.description {
                            Text(desc)
                                .foregroundColor(isCompleted ? .gray : .primary)
                        }
                        
                        if let duration = step.duration {
                            Text("Dauer: \(duration) Min")
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .opacity(isCompleted ? 0.6 : 1.0)
            }
        }
        .padding()
    }
    
    private func toggleStep(_ id: Int) {
        if completedSteps.contains(id) {
            completedSteps.remove(id)
        } else {
            completedSteps.insert(id)
        }
    }
}

#Preview {
    let stepRelation = [
        StepRelation(id: 1, RecipeStep: RecipeStep(id: 1, title: "Zutaten vorbereiten", description: "Alles klein schneiden und abwiegen.", duration: 10)),
        StepRelation(id: 2, RecipeStep: RecipeStep(id: 2, title: "Anbraten", description: "Fleisch scharf anbraten.", duration: 5)),
        StepRelation(id: 3, RecipeStep: RecipeStep(id: 3, title: "Soße köcheln", description: "Tomaten und Gewürze hinzufügen, dann 15 Minuten köcheln lassen.", duration: 15))
    ]
    StepTimeline(steps: stepRelation)
}
