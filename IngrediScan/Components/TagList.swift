//
//  TagList.swift
//  IngrediScan
//
//  Created by Faramir on 25.06.25.
//

import SwiftUI

struct TagList: View {
    var hasTags: [TagRelation]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 0) {
                ForEach(hasTags, id: \.id) { tagRelation in
                    Text(tagRelation.Tag.name)
                        .padding(8)
                        .font(.headline .bold() .smallCaps())
                        .foregroundStyle(.white)
                        .background(.orange.opacity(0.8))
                        .clipShape(Capsule())
                        .shadow(radius: 5)
                        .padding(8)
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    TagList(hasTags: Recipe.cheesecake.hasTags)
}
