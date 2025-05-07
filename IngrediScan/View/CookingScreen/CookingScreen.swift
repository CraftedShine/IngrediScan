import SwiftUI

struct CookingScreen: View {
    private let recipe: Recipe;
    
    public init(recipe: Recipe) {
        self.recipe = recipe
    }
    
    var body: some View {
        ScrollView {
            Image(self.recipe.image)
                .resizable()
                .scaledToFill()
                .frame(height: 250)
                .clipped()
                .overlay(
                    Text(self.recipe.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .shadow(color: Color.black, radius: 10, x: 0, y:2)
                )
            
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
                    
                    TimelineView(recipe: self.recipe)
                    
                    Divider()
                    
                    Annotations()
                        .padding()
        
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    CookingScreen(recipe: BurgerMock())
}
