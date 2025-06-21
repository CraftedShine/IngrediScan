//
//  CookingViewModel.swift
//  IngrediScan
//
//  Created by Faramir on 17.06.25.
//

import Foundation
import SwiftUI
import Combine

class CookingService: ObservableObject {
    static let shared = CookingService()
    
    @Published private var completedSteps: Set<String> = []
    @Published private var recipeSteps: [RecipeStep] = []
    @Published private var currentStepIndex: Int = 0
    
    func startCooking(steps: [RecipeStep]) {
        recipeSteps = steps
        completedSteps = []
        currentStepIndex = 0
    }
    
    func isCompleted(stepId: String) -> Bool {
        print(completedSteps)
        return completedSteps.contains(stepId)
    }
    
    func completeStep(stepId: String) {
        print(stepId)
        completedSteps.insert(stepId)
        print(completedSteps)
    }
    
    func uncompleteStep(stepId: String) {
        completedSteps.remove(stepId)
    }
    
    var currentStep: Int {
        return currentStepIndex
    }
    
    func previousStep() {
        guard currentStepIndex > 0 else { return }
        currentStepIndex -= 1
    }
    
    func nextStep() {
        guard currentStepIndex + 1 < recipeSteps.count else { return }
        currentStepIndex += 1
    }
}
