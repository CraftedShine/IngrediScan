//
//  TagList.swift
//  IngrediScan
//
//  Created by Faramir on 21.05.25.
//

import SwiftUI

struct TagList : View {
    @State var tags: [Tag]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(self.tags, id: \.self) { tag in
                    Button {
                        
                    } label: {
                        Text(tag.name)
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
