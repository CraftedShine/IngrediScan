//
//  TagList.swift
//  IngrediScan
//
//  Created by Faramir on 21.05.25.
//

import SwiftUI

struct TagList : View {
    @State var tags: [Tag]
    
    var showResetButton: Bool {
        tags.filter{ $0.isSelected }.count > 0
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                if (showResetButton) {
                    Button {
                        for index in tags.indices {
                            tags[index].isSelected = false
                        }
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 10, height: 10)
                            .padding(5)
                    }
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.circle)
                }
                
                
                ForEach(tags.indices, id: \.self) { index in
                    Button {
                        // Toggle tag selection
                        tags[index].isSelected.toggle()
                    } label: {
                        Text(tags[index].name)
                            .padding(.horizontal, 10)
                    }
                    .buttonStyle(.bordered)
                    .tint(tags[index].isSelected ? .blue : .gray)
                    .buttonBorderShape(.capsule)
                }
            }
            .animation(.easeInOut(duration: 0.2), value: showResetButton)
        }
        .scrollIndicators(.hidden)
        .padding()
    }
}

#Preview {
    TagList(tags: [Tag(id: 1, name: "Tag 1"), Tag(id: 2, name: "Tag 2")])
}
