import SwiftUI
import Combine

struct RecipeImagePlaceholder: View {
    var body: some View {
        Image(systemName: "photo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .scaledToFit()
            .overlay(Color.black.opacity(0.3))
    }
}

struct RecipeImage : View {
    @Binding var recipe: Recipe
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack {
                AsyncImage(url: URL(string: recipe.imageUrl)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaledToFit()
                            .overlay(Color.black.opacity(0.3))
                    case .failure(_):
                        RecipeImagePlaceholder()
                    @unknown default:
                        RecipeImagePlaceholder()
                    }
                }
                
                
                Text(recipe.name)
                    .font(.largeTitle .bold() .smallCaps())
                    .lineLimit(1)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding()
            }
        }
    }
}

struct RecipeDetailView: View {
    @EnvironmentObject var viewModel: ViewModel
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
                                    .padding(.top, 25)
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
                        
                        CookingView(recipe: recipe)
                            .padding()
                    }
                }
                .cornerRadius(16)
                .scrollIndicators(.hidden)
            }
            .edgesIgnoringSafeArea(.vertical)
        }
        .toolbarBackgroundVisibility(.hidden, for: .navigationBar, .bottomBar)
    }
}

#Preview {
    RecipeDetailView(recipe: .constant(Recipe.pizzaMargherita))
        .withPreviewEnvironmentObjects()
}
