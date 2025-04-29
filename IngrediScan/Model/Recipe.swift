//
//  Recipe.swift
//  IngrediScan
//
//  Created by Fynn Schotten on 25.04.25.
//

import Foundation

struct Recipe: Identifiable
{
    var name: String
    var image: String
    
    let id = UUID()
}
