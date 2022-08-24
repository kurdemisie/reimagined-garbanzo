//
//  RecipeTabView.swift
//  Recipe_List_App
//
//  Created by Monika on 11.8.2022.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        
        TabView {
            
            RecipeFeaturedView()
                .tabItem {
                    VStack {
                        Image(systemName: "sparkles")
                        Text("Featured")
                    }
                }
            
            RecipeListView()
                .tabItem {
                    Image(systemName: "list.star")
                    Text("List")
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
