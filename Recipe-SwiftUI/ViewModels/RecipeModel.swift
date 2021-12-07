//
//  RecipeModel.swift
//  Recipe-SwiftUI
//
//  Created by Alan Liu on 2021/12/07.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        // Parsed the local json file
        
        // Set the recipes property
    }
}
