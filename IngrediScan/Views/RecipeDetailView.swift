import SwiftUI
import Combine
import SDWebImageSwiftUI

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
                WebImage(url: URL(string: self.recipe.imageUrl)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaledToFit()
                        .overlay(Color.black.opacity(0.3))
                } placeholder: {
                    RecipeImagePlaceholder()
                }
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                
                
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
    RecipeDetailView(recipe: .constant(Recipe.spaghettiCarbonara))
        .withPreviewEnvironmentObjects()
}
