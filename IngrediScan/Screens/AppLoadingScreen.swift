//
//  AppLoadingScreen.swift
//  IngrediScan
//
//  Created by Faramir on 22.06.25.
//

import SwiftUI

struct AppLoadingScreen: View {
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea(.all)
            VStack {
                Image("AppIconImage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                Text(appName)
                    .font(.title2 .bold() .smallCaps())
                    .foregroundStyle(.black)
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
