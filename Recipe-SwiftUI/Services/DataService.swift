//
//  DataService.swift
//  Recipe-SwiftUI
//
//  Created by Alan Liu on 2021/12/10.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        // Parse local json file
        
        // Get a url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        // Check if pathString is not nil, otherwise...
        guard let pathString = pathString else { return [Recipe]() }
        
        // Create a url object
        let url = URL(fileURLWithPath: pathString)
        
        do {
            // Create a data object
            let data = try Data(contentsOf: url)
            
            // Decode the data with a json decoder
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // Add the unique IDs
                for recipe in recipeData {
                    recipe.id = UUID()
                    
                    // Add the unique IDs to recipe ingredients
                    for ingredient in recipe.ingredients {
                        ingredient.id = UUID()
                    }
                }
                
                // Return the recipes
                return recipeData
            }
            catch {
                // Error with parsing json
                print(error)
            }
        }
        catch {
            // Error with getting data
            print(error)
        }
        
        return [Recipe]()
    }
}
