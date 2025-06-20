//
//  ScrollSemo Screen.swift
//  IngrediScan
//
//  Created by Jan Keller on 13.06.25.
//

import SwiftUI

struct ScrollDemoScreen: View {
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                VStack(spacing: 30) {

                    // **OBERE BOX**
                    VStack {
                        Text("Obere Box")
                            .font(.title)
                            .padding()

                        Button("Nach unten scrollen") {
                            withAnimation {
                                proxy.scrollTo("bottomBox", anchor: .top)
                            }
                        }
                        .buttonStyle(.borderedProminent)
                        .padding()
                    }
                    .frame(height: 600)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.blue.opacity(0.3)))
                    .padding()

                    // **UNTERE BOX**
                    VStack {
                        Text("Untere Box")
                            .font(.title)
                            .padding()
                    }
                    .frame(height: 1000)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.green.opacity(0.3)))
                    .padding()
                    .id("bottomBox") // ID für ScrollViewReader
                }
            }
        }
    }
}

#Preview {
    ScrollDemoScreen()
}
