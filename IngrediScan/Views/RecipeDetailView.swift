import SwiftUI
import Combine

struct RecipeDetailView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var recipe: Recipe
    @State private var isCooking: Bool = false
    @State private var timerDuration: Int = 0
    
    init(recipe: Binding<Recipe>) {
        self._recipe = recipe
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                ScrollView {
                    VStack(alignment: .leading) {
                        ZStack(alignment: .top) {
                            RecipeImage(recipe: $recipe)
                            
                            HStack {
                                DismissButton(dismiss: _dismiss)
                                Spacer()
                                Text("Details")
                                    .font(.title .bold() .smallCaps())
                                Spacer()
                                ToggleFavoriteButton(recipe: $recipe)
                            }
                            .foregroundStyle(.white)
                        }
                        
                        CardTagList(hasTags: recipe.hasTags)
                            .padding()
                        
                        Divider()
                        
                        CookingStatistics(recipe: recipe)
                            .padding()
                        
                        Divider()
                        
                        IngredientList(ingredientUsage: recipe.usesIngredients)
                            .padding()
                        
                        Divider()
                        
                        CookingView(recipe: $recipe)
                    }
                }
                .cornerRadius(16)
                .scrollIndicators(.hidden)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .toolbarBackgroundVisibility(.hidden, for: .navigationBar, .bottomBar)
    }
}

#Preview {
    RecipeDetailView(recipe: .constant(Recipe.pizzaMargherita))
}
