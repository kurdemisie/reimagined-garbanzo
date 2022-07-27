//
//  ReceipeDetailView.swift
//  Recipe_List_App
//
//  Created by Monika on 18.1.2022.
//

import SwiftUI

struct ReceipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        ScrollView {
            
            VStack (alignment: .leading) {
                
                //MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                //MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredientes")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                    
                    ForEach (recipe.ingredients, id: \.self) {item in
                        Text("• " + item)
                            .padding(.bottom, 1)
                    }
                }
                .padding(.horizontal)
                
                Divider()
                
                //MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                    
                    ForEach (0..<recipe.directions.count, id: \.self) {index in
                        Text(String(index+1) + ". " + recipe.directions[index])
                            .padding(.bottom, 5)
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationBarTitle(recipe.name)
    }
}

struct ReceipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        //create a dummy receipe and pass it to the detailView so that we can see a preview
        let model = RecipeModel()
        
        ReceipeDetailView(recipe: model.recipes[0])
    }
}
