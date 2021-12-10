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
        // Create an instance of data service and get the data
        recipes = DataService.getLocalData()
        
    }
}
