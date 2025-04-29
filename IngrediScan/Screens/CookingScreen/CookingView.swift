import SwiftUI

struct CookingView: View {
    private let recipe: Recipe;
    
    public init(recipe: Recipe) {
        self.recipe = recipe
    }
    
    var body: some View {
        ScrollView {
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
                    Text("Italienischer Pizzateig")
                        .font(.title .bold())
                    Text("Im lauwarmen Wasser und dem Olivenöl die Hefe mit Salz und Zucker auflösen. Dann das Mehl hinzufügen und einen glatten Teig kneten. Den Teig eine halbe Stunde an einem warmen Ort gehen lassen, zusammenkneten und abgedeckt im Kühlschrank 2 Tage ruhen lassen. Nun kann man vom Teig eine herrlich frische Pizza herstellen. Der Teig reicht für 6 runde Pizzen.")
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Anmerkungen")
                            .font(.subheadline .smallCaps())
                            .foregroundColor(.gray)
                        Text("Belegen kann man diese nach Belieben, natürlich sollten die Tomatensauce und der Käse nicht fehlen. Ich habe sie schon auf einem Blech sowie auf verschiedenen runden Pizzaformen gebacken. Sie wird immer supertoll und schmeckt original wie von meinem Lieblingsitaliener. Wenn man die Menge entsprechend reduzieren möchte, ist das auch kein Problem. Die Menge der Hefe habe ich jedoch immer bei 40 g gelassen. Am besten gelingt die Pizza, wenn man den Ofen sehr gut auf der höchstmöglichen Temperatur vorheizt!")
                            .multilineTextAlignment(.leading)
                    }
                }
            }
            .padding()
            Spacer()
        }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    CookingView(recipe: Recipe(name: "Pizza", image: "pizza"))
}
