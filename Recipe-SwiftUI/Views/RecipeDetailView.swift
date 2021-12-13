//
//  RecipeDetailView.swift
//  Recipe-SwiftUI
//
//  Created by Alan Liu on 2021/12/12.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe: Recipe
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                // MARK: Recipe image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                    .padding(.bottom, 5.0)
                
                // MARK: Ingredients
                Text("Ingredients")
                    .font(.headline)
                    .padding(.bottom, 5.0)
                    .padding(.horizontal)
                
                ForEach (recipe.ingredients, id: \.self) { ingredient in
                    Text("- " + ingredient)
                }
                .padding(.horizontal)
                
                // MARK: Divider
                Divider()
                
                // MARK: Directions
                Text("Directions")
                    .font(.headline)
                    .padding([.top, .bottom], 5.0)
                    .padding(.horizontal)
                
                ForEach(0..<recipe.directions.count, id: \.self) { index in
                    Text(String(index+1) + ". " + recipe.directions[index])
                        .padding(.bottom, 5.0)
                }
                .padding(.horizontal)
            }
        }
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a dummy recipe and pass it into the detail view so that we can see a preview
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
