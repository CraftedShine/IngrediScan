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
            
            Text(step.description)
                .foregroundColor(isCompleted ? .gray : .primary)
            
            Text("Dauer: \(step.duration) Min")
                .font(.footnote)
                .foregroundColor(.gray)
            
        }
    }
}

struct TimelineIndicator: View {
    @Binding var completedSteps: Set<String>
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
    
    private func toggleStep(_ id: String) {
        if completedSteps.contains(id) {
            completedSteps.remove(id)
        } else {
            completedSteps.insert(id)
        }
    }
}

struct StepTimeline: View {
    @Binding var steps: [StepRelation]
    
    @State private var completedSteps: Set<String> = []
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
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
    StepTimeline(steps: .constant(Recipe.caesarSalad.hasSteps))
}
