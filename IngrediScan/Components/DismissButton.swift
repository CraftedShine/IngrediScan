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
        Button {
            dismiss()
        } label: {
            Text("X")
                .font(.title .bold())
                .frame(width: 20, height: 20)
                .foregroundStyle(.white)
                .padding(10)
                .background(Color.black.opacity(0.5))
                .clipShape(Circle())
        }
        .padding(30)
    }
}

#Preview {
    DismissButton()
}
