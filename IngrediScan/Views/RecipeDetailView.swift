import SwiftUI

struct RecipeDetailView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var recipe: Recipe
    @State private var detailedCooking: Bool = false
    
    var body: some View {
        ScrollView {
            Image(self.recipe.imageUrl)
                .resizable()
                .scaledToFill()
                .frame(maxHeight: 250)
                .clipped()
                .overlay{
                    ZStack {
                        Rectangle()
                            .foregroundStyle(.black.opacity(0.4))
                        Text(self.recipe.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .shadow(color: Color.black, radius: 10, x: 0, y:2)
                    }
                }
            
            // Preparation Title
            VStack(alignment: .leading, spacing: 8) {
                
                CookingStatistics(recipe: self.recipe)
                    .padding()
                    .shadow(radius: 5)
                }
            }
            .scrollIndicators(.hidden)
            .edgesIgnoringSafeArea(.top)
        }
    }
}

#Preview {
    RecipeDetailView(recipe: .constant(RecipeViewModel().recipes[4]))
}
