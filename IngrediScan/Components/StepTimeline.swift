//
//  TimelineView.swift
//  IngrediScan
//
//  Created by Faramir on 07.05.25.
//

import SwiftUI

struct StepContent: View {
    @EnvironmentObject var cookingViewModel: CookingViewModel
    @Binding var step: RecipeStep
    let index: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Schritt \(index + 1): \(step.title)")
                .fontWeight(.semibold)
                .strikethrough(isCompleted, color: .gray)
            
            if let description = step.description {
                Text(description)
                    .foregroundColor(isCompleted ? .gray : .primary)
            }
            
            Text("Dauer: \(step.duration) Min")
                .font(.footnote)
                .foregroundColor(.gray)
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.gray.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
    
    var isCompleted: Bool {
        return cookingViewModel.isCompleted(stepId: step.id)
    }
}

struct TimelineIndicator: View {
    @EnvironmentObject var timerViewModel: TimerViewModel
    @EnvironmentObject var cookingViewModel: CookingViewModel
    @Binding var step: RecipeStep
    
    var body: some View {
        CircularButton(size: 15, padding: 5, color: isCompleted ? .green : .orange, image: "checkmark") {
            cookingViewModel.toggleStep(step.id)
        }
    }
    
    var isCompleted: Bool {
        return cookingViewModel.isCompleted(stepId: step.id)
    }
}

struct StepTimeline: View {
    @EnvironmentObject var timerViewModel: TimerViewModel
    @EnvironmentObject var cookingViewModel: CookingViewModel
    @Binding var steps: [RecipeStep]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            let stepsArray = Array($steps.enumerated())
            
            ForEach(stepsArray, id: \.element.id) { index, $step in
                let isCompleted = cookingViewModel.isCompleted(stepId: step.id)
                
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
                    StepContent(step: $step, index: index)
                    
                }
                .opacity(isCompleted ? 0.6 : 1.0)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .onChange(of: cookingViewModel.currentStep) {
            let currentStep = self.steps[cookingViewModel.currentStep]
            
            // * 60 because Recipe from Database gives duration in Minutes
            self.timerViewModel.setTime(to: TimeInterval(currentStep.duration * 60))
        }
        .onAppear {
            cookingViewModel.startCooking(steps: steps)
        }
        .padding()
    }
}

#Preview {
    let steps: [RecipeStep] = Recipe.spaghettiCarbonara.hasSteps.compactMap { $0.RecipeStep }
    
    StepTimeline(steps: .constant(steps))
        .withPreviewEnvironmentObjects()
}
