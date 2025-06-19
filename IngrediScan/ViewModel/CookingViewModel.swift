//
//  CookingViewModel.swift
//  IngrediScan
//
//  Created by Faramir on 17.06.25.
//

import Foundation

@MainActor
class CookingViewModel: ObservableObject {
    @Published var steps: [RecipeStep]
    @Published var currentStep: RecipeStep
    @Published var currentStepIndex: Int = 0
    
    init(steps: [RecipeStep]) {
        self.steps = steps
        self.currentStep = steps.first!
        self.currentStepIndex = 0
    }
    
    func nextStep() {
        guard currentStepIndex + 1 < steps.count else { return }
        currentStepIndex += 1
        currentStep = steps[currentStepIndex]
    }
}
