//
//  TimelineView.swift
//  IngrediScan
//
//  Created by Faramir on 07.05.25.
//

import SwiftUI

struct StepContent: View {
    let index: Int
    @ObservedObject var cookingService = CookingService.shared
    @Binding var step: RecipeStep
    
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
        .padding()
        .background(.gray.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
    
    var isCompleted: Bool {
        return cookingService.isCompleted(stepId: step.id)
    }
}

struct TimelineIndicator: View {
    @ObservedObject var cookingService = CookingService.shared
    @Binding var step: RecipeStep
    
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
    
    func toggleStep(_ id: String) {
        if isCompleted {
            cookingService.uncompleteStep(stepId: id)
            cookingService.previousStep()
        } else {
            cookingService.completeStep(stepId: step.id)
            cookingService.nextStep()
        }
    }
    
    var isCompleted: Bool {
        return cookingService.isCompleted(stepId: step.id)
    }
}

struct StepTimeline: View {
    @ObservedObject var cookingService = CookingService.shared
    @Binding var steps: [RecipeStep]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            let stepsArray = Array($steps.enumerated())
            
            ForEach(stepsArray, id: \.element.id) { index, $step in
                let isCompleted = cookingService.isCompleted(stepId: step.id)
                
                HStack(alignment: .top) {
                    VStack(spacing: 12) {
                        //MARK: Timeline indicator
                        TimelineIndicator(step: $step)
                        
                        //MARK: Line between Indicators
                        if index < steps.count - 1 {
                            Rectangle()
                                .fill(.gray)
                                .frame(maxWidth: 2, maxHeight: 200)
                        }
                    }
                    
                    // Step content
                    StepContent(index: index, step: $step)
                    
                }
                .opacity(isCompleted ? 0.6 : 1.0)
            }
        }
        .onAppear {
            cookingService.startCooking(steps: steps)
        }
        .padding()
    }
}

#Preview {
    StepTimeline(steps: .constant(Recipe.caesarSalad.hasSteps.compactMap {$0.RecipeStep}))
}
