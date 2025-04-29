//
//  CookingContent.swift
//  IngrediScan
//
//  Created by Faramir on 29.04.25.
//

import SwiftUI

struct CookingContent: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Italienischer Pizzateig")
                .font(.title .bold())
            Text("Im lauwarmen Wasser und dem Olivenöl die Hefe mit Salz und Zucker auflösen. Dann das Mehl hinzufügen und einen glatten Teig kneten. Den Teig eine halbe Stunde an einem warmen Ort gehen lassen, zusammenkneten und abgedeckt im Kühlschrank 2 Tage ruhen lassen. Nun kann man vom Teig eine herrlich frische Pizza herstellen. Der Teig reicht für 6 runde Pizzen.")
        }
    }
}

#Preview {
    CookingContent()
}
