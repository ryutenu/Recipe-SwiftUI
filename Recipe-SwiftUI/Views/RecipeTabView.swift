//
//  RecipeTabView.swift
//  Recipe-SwiftUI
//
//  Created by Alan Liu on 2021/12/13.
//

import SwiftUI

struct RecipeTabView: View {
    
    @EnvironmentObject var model: RecipeModel
    
    var body: some View {
        
        TabView {
            RecipeFeaturedView()
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }
            
            RecipeListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
        }
        .environmentObject(RecipeModel())
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
