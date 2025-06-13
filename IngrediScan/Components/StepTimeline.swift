//
//  TimelineView.swift
//  IngrediScan
//
//  Created by Faramir on 07.05.25.
//

import SwiftUI

struct StepContent: View {
    let index: Int
    var step: RecipeStep
    @Binding var isCompleted: Bool
    
    var body: some View {
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
}

struct TimelineIndicator: View {
    @Binding var completedSteps: Set<Int>
    @Binding var step: RecipeStep
    @Binding var isCompleted: Bool
    
    var body: some View {
        Button {
            toggleStep(step.id)
        } label: {
            ZStack {
                Circle()
                    .fill(isCompleted ? Color.green : Color.orange)
                    .frame(width: 25, height: 25)
                
                Image(systemName: "checkmark")
                    .font(.system(size: 15))
                    .foregroundColor(.white)
                
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    private func toggleStep(_ id: Int) {
        if completedSteps.contains(id) {
            completedSteps.remove(id)
        } else {
            completedSteps.insert(id)
        }
    }
}

struct StepTimeline: View {
    var steps: [StepRelation]
    
    @State private var completedSteps: Set<Int> = []
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Zubereitung")
                .font(.subheadline.smallCaps().bold())
                .foregroundColor(.secondary)
            
            ForEach(Array(steps.enumerated()), id: \.element.id) { index, stepRelation in
                let step = stepRelation.RecipeStep
                let isCompleted = completedSteps.contains(step.id)
                
                HStack(alignment: .top) {
                    VStack(spacing: 12) {
                        //MARK: Timeline indicator
                        TimelineIndicator(completedSteps: $completedSteps, step: .constant(step), isCompleted: .constant(isCompleted))
                        
                        //MARK: Line between Indicators
                        if index < steps.count - 1 {
                            Rectangle()
                                .fill(.gray)
                                .frame(maxWidth: 2, maxHeight: .infinity)
                        }
                    }
                    
                    // Step content
                    StepContent(index: index, step: step, isCompleted: .constant(isCompleted))
                    
                }
                .opacity(isCompleted ? 0.6 : 1.0)
            }
        }
        .padding()
    }
}

#Preview {
    let stepRelation = [
        StepRelation(id: 1, stepId: 1, RecipeStep: RecipeStep(id: 1, title: "Zutaten vorbereiten", description: "Alles klein schneiden und abwiegen.", duration: 10)),
        StepRelation(id: 2, stepId: 2, RecipeStep: RecipeStep(id: 2, title: "Anbraten", description: "Fleisch scharf anbraten.", duration: 5)),
        StepRelation(id: 3, stepId: 3, RecipeStep: RecipeStep(id: 3, title: "Soße köcheln", description: "Tomaten und Gewürze hinzufügen, dann 15 Minuten köcheln lassen.", duration: 15))
    ]
    StepTimeline(steps: stepRelation)
}
