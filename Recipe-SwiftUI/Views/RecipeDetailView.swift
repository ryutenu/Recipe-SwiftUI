//
//  RecipeDetailView.swift
//  Recipe-SwiftUI
//
//  Created by Alan Liu on 2021/12/12.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe: Recipe
    
    @State var selectedServingSize = 2
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                // MARK: Recipe image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Recipe title
                Text(recipe.name)
                    .bold()
                    .padding(.top, 20)
                    .padding(.leading)
                    .font(Font.custom("Avenir Heavy", size: 24))
                
                // MARK: Serving size picker
                VStack(alignment: .leading) {
                    Text("Select your serving size:")
                        .font(Font.custom("Avenir", size: 15))
                    
                    Picker("", selection: $selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .font(Font.custom("Avenir", size: 15))
                    .pickerStyle(.segmented)
                    .frame(width: 160)
                }
                .padding()
                
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(Font.custom("Avenir Heavy", size: 16))
                        .padding([.bottom, .top], 5)
                    
                    ForEach (recipe.ingredients) { ingredient in
                        
                        Text("- " + RecipeModel.getPortion(ingredient: ingredient, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + ingredient.name.lowercased())
                            .font(Font.custom("Avenir", size: 15))
                    }
                }
                .padding(.horizontal)
                
                // MARK: Divider
                Divider()
                
                // MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(Font.custom("Avenir Heavy", size: 16))
                        .padding([.top, .bottom], 5.0)
                    
                    ForEach(0..<recipe.directions.count, id: \.self) { index in
                        Text(String(index+1) + ". " + recipe.directions[index])
                            .padding(.bottom, 5)
                            .font(Font.custom("Avenir", size: 15))
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a dummy recipe and pass it into the detail view so that we can see a preview
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
