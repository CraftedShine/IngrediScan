import SwiftUI

struct CardTagList: View {
    var hasTags: [TagRelation]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(hasTags, id: \.id) { tagRelation in
                    Button {
                        
                    } label: {
                        Text(tagRelation.Tag.name)
                    }
                    .padding(10)
                    .buttonStyle(.plain)
                    .background(.orange)
                    .clipShape(Capsule())
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

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
                            .padding()
                    }
                    
                    Divider()
                    
                    CookingStatistics(recipe: recipe)
                        .padding()
                    
                    Divider()
                    
                    if let ingredients = recipe.usesIngredients {
                        IngredientList(ingredientUsage: ingredients)
                            .padding()
                    }
                    
                    Divider()
                    
                    if let steps = recipe.hasSteps {
                        StepTimeline(steps: steps)
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
                            .padding(5)
                            .buttonStyle(.plain)
                            .background(.orange)
                            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
                            .padding(.top)
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
    RecipeDetailView(recipe: .constant(Recipe.pizzaMargherita))
}
