import SwiftUI

struct RecipeDetailView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var recipe: Recipe
    @State private var detailedCooking: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                ZStack(alignment: .topLeading) {
                    VStack {
                        VStack(alignment: .leading) {
                            RecipeImage(recipe: $recipe)
                            TagList(tags: recipe.tags)
                            CookingStatistics(recipe: recipe)
                                .padding()
                            IngredientList(recipe: recipe)
                                .padding()
                        }
                        
                        Button {
                            detailedCooking.toggle()
                        } label: {
                            Text("Kochen starten")
                                .font(.callout .bold() .smallCaps())
                        }
                        .buttonStyle(.borderedProminent)
                        .padding(.bottom)
                        .fullScreenCover(isPresented: $detailedCooking) {
                            CookingView(recipe: $recipe)
                                .presentationBackground(.black.opacity(0.5))
                        }
                    }
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(20)
                    .padding()
                    .shadow(radius: 5)
                    
                    DismissButton(dismiss: _dismiss)
                }
            }
            .scrollIndicators(.hidden)
            .background(.black.opacity(0.5))
        }
    }
}

#Preview {
    RecipeDetailView(recipe: .constant(MockData().recipes[0]))
}
