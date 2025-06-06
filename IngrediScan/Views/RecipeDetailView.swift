import SwiftUI

struct RecipeDetailView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var recipe: Recipe
    @State private var detailedCooking: Bool = false
    
    var body: some View {
        NavigationView {
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
                    
                    if let tags = recipe.hasTags {
                        CardTagList(hasTags: tags)
                            .padding(.horizontal)
                    }
                    
                    CookingStatistics(recipe: recipe)
                        .padding()
                    
                    Divider()
                    
                    if let ingredients = recipe.usesIngredients {
                        IngredientList(ingredientUsage: ingredients)
                            .padding()
                    }
                    
                }
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        VStack {
                            Divider()
                            Button {
                                detailedCooking.toggle()
                            } label: {
                                Text("Kochen starten")
                                    .font(.callout .bold() .smallCaps())
                            }
                            .buttonStyle(.borderedProminent)
                            .padding(.top)
                            .sheet(isPresented: $detailedCooking) {
                                CookingView(recipe: $recipe)
                                    .presentationDetents([.large])
                                    .presentationCornerRadius(16)
                            }
                        }
                    }
                }
                .toolbarBackgroundVisibility(.hidden, for: .navigationBar, .bottomBar)
            }
            .cornerRadius(16)
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    RecipeDetailView(recipe: .constant(MockData().recipes[0]))
}
