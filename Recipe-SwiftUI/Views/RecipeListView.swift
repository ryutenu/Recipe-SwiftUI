//
//  RecipeListView.swift
//  Recipe-SwiftUI
//
//  Created by Alan Liu on 2021/12/07.
//

import SwiftUI

struct RecipeListView: View {
    
    // Reference the view model
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
