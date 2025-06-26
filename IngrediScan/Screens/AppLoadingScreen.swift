//
//  AppLoadingScreen.swift
//  IngrediScan
//
//  Created by Faramir on 22.06.25.
//

import SwiftUI

struct AppLoadingScreen: View {
    @State private var imageScale: CGFloat = 1.0
    @State private var textOffset: CGFloat = 100
    @State private var showText = false
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea(.all)
            VStack {
                Image("AppIconImage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .scaleEffect(imageScale)
                    .animation(.easeInOut(duration: 1.0), value: imageScale)
                Text(appName)
                    .font(.title2 .bold() .smallCaps())
                    .foregroundStyle(.black)
                    .offset(y: textOffset)
                    .opacity(showText ? 1 : 0)
                    .animation(.spring(response: 0.6, dampingFraction: 0.7), value: textOffset)
            }
        }
        .onAppear {
            imageScale = 1.5
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                textOffset = 0
                showText = true
            }
        }
    }
    
    private var appName: String {
        Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ??
        Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String ??
        "App Name"
    }
}

#Preview {
    AppLoadingScreen()
}
