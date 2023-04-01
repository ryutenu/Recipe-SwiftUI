//
//  RecipeListView.swift
//  Recipe-SwiftUI
//
//  Created by Alan Liu on 2021/12/07.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model: RecipeModel
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading) {
                Text("All Recipes")
                    .bold()
                    .padding(.top, 40)
                    .font(.largeTitle)
                
                ScrollView {
                    // Use with ScrollView, only load data necessarily, save memory
                    LazyVStack(alignment: .leading) {
                        ForEach(model.recipes) { recipe in
                            
                            NavigationLink {
                                RecipeDetailView(recipe: recipe)
                            } label: {
                                
                                // MARK: Row item
                                HStack(spacing: 20.0) {
                                    Image(recipe.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .clipped()
                                        .cornerRadius(5)
                                    
                                    Text(recipe.name)
                                        .foregroundColor(.black)
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarHidden(true)
            .padding(.leading)
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
