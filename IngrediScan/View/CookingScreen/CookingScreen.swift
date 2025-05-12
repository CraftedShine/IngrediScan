import SwiftUI

struct CookingScreen: View {
    @State private var recipe: Recipe
    @State private var detailedCooking: Bool = false
    
    public init(recipe: Recipe) {
        self.recipe = recipe
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                Image(self.recipe.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 250)
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
                        Button {
                            detailedCooking.toggle()
                        } label: {
                            Text("Zubereitung")
                                .font(.callout .bold() .smallCaps())
                                .foregroundStyle(.secondary)
                                .padding(.leading)
                        }
                        .foregroundStyle(.secondary)
                        
                        TimelineView(recipe: self.recipe)
                        
                        Divider()
                    }
                }
            }
            .edgesIgnoringSafeArea(.top)
            .sheet(isPresented: $detailedCooking) {
                NavigationView {
                    TimelineView(recipe: self.recipe)
                        .toolbar {
                            ToolbarItem(placement: .topBarLeading) {
                                VStack {
                                    Text("Zubereitung")
                                        .font(.title2 .bold() .smallCaps())
                                    Divider()
                                }
                            }
                        }
                        .presentationDragIndicator(.visible)
                        .presentationDetents([.fraction(0.33)])
                }
            }
        }
    }
}

#Preview {
    CookingScreen(recipe: BurgerMock())
}
