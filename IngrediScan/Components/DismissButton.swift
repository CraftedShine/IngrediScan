//
//  DismissButton.swift
//  IngrediScan
//
//  Created by Faramir on 24.05.25.
//

import SwiftUI

struct DismissButton: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Image(systemName: "x.circle")
            .resizable()
            .foregroundStyle(.background)
            .aspectRatio(contentMode: .fit)
            .frame(width: 30, height: 30)
            .padding(30)
            .onTapGesture {
                dismiss()
            }
    }
}

#Preview {
    DismissButton()
}
