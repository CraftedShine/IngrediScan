//
//  CookingView.swift
//  IngrediScan
//
//  Created by Faramir on 16.06.25.
//

import SwiftUI
import Combine

struct CookingView: View {
    @EnvironmentObject var viewModel: ViewModel
    @EnvironmentObject var timerViewModel: TimerViewModel
    @EnvironmentObject var cookingViewModel: CookingViewModel
    @State var recipe: Recipe
    @State var recipeSteps: [RecipeStep]
    @State var isCooking: Bool = false
    
    init(recipe: Recipe) {
        self.recipe = recipe
        self.recipeSteps = recipe.hasSteps.compactMap { $0.RecipeStep }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Zubereitung")
                .font(.subheadline.smallCaps().bold())
                .foregroundColor(.secondary)
            
            VStack(alignment: .leading) {
                if !cookingViewModel.isFinished {
                    InlineTimerView()
                }
                
                if isCooking && cookingViewModel.isFinished {
                    RoundedRectangularButton(title: "Kochen beenden", color: .green) {
                        removeIngredientsFromFridge()
                    }
                }
                
                if !isCooking && cookingViewModel.isFinished {
                    Text("Zutaten wurden aus dem Kühlschrank entfernt.")
                }
                
                StepTimeline(steps: .constant(recipeSteps))
            }
        }
        .onAppear {
            NotificationService.shared.requestPermission()
            
            if let firstStep = self.recipeSteps.first {
                timerViewModel.setTime(to: TimeInterval(firstStep.duration * 60))
                self.isCooking = true
            }
        }
    }
    
    func removeIngredientsFromFridge() {
        let ingredientUsage = self.recipe.usesIngredients
        
        for usage in ingredientUsage {
            let ingredient = usage.ingredient
            let ingredientInFridge = IngredientInFridge(id: ingredient.id, name: ingredient.name, amount: usage.amount, icon: ingredient.icon, Unit: ingredient.unit)
            
            viewModel.editIngredientInFridge(ingredientId: ingredient.id, amount: -usage.amount, ingredient: ingredientInFridge)
        }
        self.isCooking = false
    }
}

#Preview {
    CookingView(recipe: Recipe.cheesecake)
        .withPreviewEnvironmentObjects()
}
