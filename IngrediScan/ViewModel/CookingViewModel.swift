//
//  CookingViewModel.swift
//  IngrediScan
//
//  Created by Faramir on 17.06.25.
//

import Foundation
import SwiftUI
import Combine

class CookingViewModel: ObservableObject {
    @Published private var completedSteps: Set<Int> = []
    @Published private var recipeSteps: [RecipeStep] = []
    @Published private var currentStepIndex: Int = 0
    
    var currentStep: Int {
        return currentStepIndex
    }
    
    var isFinished: Bool {
        return completedSteps.isSuperset(of: recipeSteps.map { $0.id })
    }
    
    func startCooking(steps: [RecipeStep]) {
        recipeSteps = steps
        completedSteps = []
        currentStepIndex = 0
    }
    
    func isCompleted(stepId: Int) -> Bool {
        return completedSteps.contains(stepId)
    }
    
    func toggleStep(_ stepId: Int) {
        if completedSteps.contains(stepId) {
            completedSteps.remove(stepId)
            previousStep()
        } else {
            completedSteps.insert(stepId)
            nextStep()
        }
    }
    
    private func previousStep() {
        guard currentStepIndex > 0 else { return }
        currentStepIndex -= 1
    }
    
    private func nextStep() {
        guard currentStepIndex + 1 < recipeSteps.count else { return }
        currentStepIndex += 1
    }
}
