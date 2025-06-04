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
                Button {
                    
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 10, height: 10)
                        .padding(5)
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.circle)
                
                ForEach(self.tags, id: \.self) { tag in
                    if(tag.id == 1) {
                        Button {
                            
                        } label: {
                            Text(tag.name)
                        }
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.capsule)
                    } else {
                        Button {
                            
                        } label: {
                            Text(tag.name)
                        }
                        .buttonStyle(.bordered)
                        .buttonBorderShape(.capsule)
                    }
                    
                }
            }
        }
        .scrollIndicators(.hidden)
        .padding()
    }
}

#Preview {
    TagList(tags: [Tag(id: 1, name: "Tag 1"), Tag(id: 2, name: "Tag 2")])
}
