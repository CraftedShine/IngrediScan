import SwiftUI

struct RecipeDetailView: View {
    @State var recipe: Recipe
    @State private var detailedCooking: Bool = false
    
    var body: some View {
        ScrollView {
            Image(self.recipe.imageName)
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
                
                Divider()
                
                IngredientList(recipe: self.recipe)
                    .padding()
                
                Divider()
                    .padding(.bottom)
                
                // Cooking Section
                VStack(alignment: .leading, spacing: 8) {
                    Text("Zubereitung")
                        .font(.callout .bold() .smallCaps())
                        .foregroundStyle(.secondary)
                        .padding(.leading)
                    
                    StepTimeline(items: self.$recipe.steps)
                    
                    Divider()
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    RecipeDetailView(recipe: RecipeViewModel().recipes[4])
}
