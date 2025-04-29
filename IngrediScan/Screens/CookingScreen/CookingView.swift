import SwiftUI

struct CookingView: View {
    private let recipe: Recipe;
    
    public init(recipe: Recipe) {
        self.recipe = recipe
    }
    
    var body: some View {
        ScrollView {
            Image(recipe.image)
                .resizable()
                .scaledToFill()
                .frame(height: 250)
                .clipped()
                .overlay(
                    Text(recipe.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .shadow(color: Color.black, radius: 10, x: 0, y:2)
                )
            
            // Preparation Title
            VStack(alignment: .leading, spacing: 8) {
                Text("Zubereitung")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                CookingStatistics()
                IngredientList()
            
                // Cooking Section
                VStack(alignment: .leading, spacing: 8) {
                    CookingContent()
                        .padding()
                    Divider()
                    Annotations()
                        .padding()
        
                }
            }
            .padding()
        }
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    CookingView(recipe: Recipe(name: "Pizza", image: "pizza"))
}
