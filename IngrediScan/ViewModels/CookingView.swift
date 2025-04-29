import SwiftUI

struct CookingView: View {
    private let recipe: Recipe;
    
    public init(recipe: Recipe) {
        self.recipe = recipe
    }
    
    var body: some View {
        VStack(spacing: 0) {
            // Image
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
                        .shadow(color: Color.black, radius: 10, x: 0, y: 2)
                )
            
            // Preparation Title
            VStack(alignment: .leading, spacing: 8) {
                Text("Zubereitung")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top)
                
                // Ingredients Section
                VStack(alignment: .leading, spacing: 8) {
                    Text("Ingredients")
                        .font(.subheadline .smallCaps())
                        .foregroundColor(.gray)
                    
                    // Ingredients List
                    List {
                        Text("Tomaten 2 Stk.")
                        Text("Mehl 200g")
                        Text("Backpulver 2EL")
                    }
                    .listStyle(.plain)
                    .background(.clear)
                    .cornerRadius(12)
                }
                VStack(alignment: .leading, spacing: 8) {
                    Text("Teig anmischen")
                        .font(.subheadline .bold())
                }
            }
            .padding()
            Spacer()
        }
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    CookingView(recipe: Recipe(name: "Pizza", image: "pizza"))
}
