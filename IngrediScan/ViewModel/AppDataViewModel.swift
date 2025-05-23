//
//  AppDataViewModel.swift
//  IngrediScan
//
//  Created by Faramir on 09.05.25.
//

import SwiftUI
import Foundation

class AppDataViewModel: ObservableObject {
    var selectedTab: Int = 0
    var tags: [String] = ["Auflauf", "Aufstrich", "Brotspeise", "Eierspeise", "Eintopf", "Mehlspeisen"]
}
