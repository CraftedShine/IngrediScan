import SwiftUI

struct CookingScreen: View {
    @Binding var selectedTab: Int
    private let recipe: Recipe;
    
    public init(recipe: Recipe, selectedTab: Binding<Int>) {
        self.recipe = recipe
        _selectedTab = selectedTab
    }
    
    var body: some View {
        NavigationView {
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
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        selectedTab = 0
                    } label: {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                    }
                    .buttonBorderShape(.capsule)
                    .buttonStyle(.bordered)
                    .foregroundStyle(.white)
                }
                
                ToolbarItem(placement: .principal) {
                    Text(self.recipe.name)
                        .font(.headline .bold() .smallCaps())
                }
            }
            .edgesIgnoringSafeArea(.top)
        }
    }
}

#Preview {
    CookingScreen(recipe: BurgerMock(), selectedTab: .constant(2))
}
