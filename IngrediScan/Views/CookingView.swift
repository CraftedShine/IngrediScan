//
//  CookingView.swift
//  IngrediScan
//
//  Created by Faramir on 16.06.25.
//

import SwiftUI
import Combine

struct CookingView: View {
    @ObservedObject var cookingService = CookingService.shared
    @State var recipe: Recipe
    @State var recipeSteps: [StepRelation]
    @State var timerDuration: Int
    @State var timeRemaining: Int
    
    init(recipe: Recipe) {
        self.recipe = recipe
        self.recipeSteps = recipe.hasSteps
        self.timerDuration = recipe.hasSteps.first!.RecipeStep.duration
        self.timeRemaining = recipe.hasSteps.first!.RecipeStep.duration
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Zubereitung")
                .font(.subheadline.smallCaps().bold())
                .foregroundColor(.secondary)
            
            VStack {
                CookingTimer(duration: self.$timerDuration, timeRemaining: self.$timeRemaining)
                    .onChange(of: cookingService.currentStep) {
                        self.timerDuration = self.recipeSteps[cookingService.currentStep].RecipeStep.duration
                        self.timeRemaining = self.recipeSteps[cookingService.currentStep].RecipeStep.duration
                    }
                StepTimeline(steps: .constant(recipeSteps.compactMap {$0.RecipeStep}))
            }
        }
        .onAppear {
            cookingService.startCooking(steps: recipeSteps.compactMap { $0.RecipeStep })
            
        }
    }
}

#Preview {
    CookingView(recipe: Recipe.cheesecake)
}
