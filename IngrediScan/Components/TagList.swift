//
//  TagList.swift
//  IngrediScan
//
//  Created by Faramir on 21.05.25.
//

import SwiftUI

struct TagList : View {
    @State var tags: [String]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(self.tags, id: \.self) { tag in
                    Button {
                        
                    } label: {
                        Text(tag)
                    }
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                }
            }
        }
        .scrollIndicators(.hidden)
        .padding()
    }
}
