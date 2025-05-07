//
//  Annotations.swift
//  IngrediScan
//
//  Created by Faramir on 29.04.25.
//

import SwiftUI

struct Annotations: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Anmerkungen")
                .font(.subheadline .smallCaps() .bold())
                .foregroundColor(.secondary)
            Text("Belegen kann man diese nach Belieben, natürlich sollten die Tomatensauce und der Käse nicht fehlen. Ich habe sie schon auf einem Blech sowie auf verschiedenen runden Pizzaformen gebacken. Sie wird immer supertoll und schmeckt original wie von meinem Lieblingsitaliener. Wenn man die Menge entsprechend reduzieren möchte, ist das auch kein Problem. Die Menge der Hefe habe ich jedoch immer bei 40 g gelassen. Am besten gelingt die Pizza, wenn man den Ofen sehr gut auf der höchstmöglichen Temperatur vorheizt!")
                .multilineTextAlignment(.leading)
        }
    }
}

#Preview {
    Annotations()
}
