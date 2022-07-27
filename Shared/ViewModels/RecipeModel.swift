//
//  RecipeModel.swift
//  Recipe_List_App (iOS)
//
//  Created by Monika on 17.1.2022.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        //get the data
        self.recipes = DataService.getLocalData()
        
    }
}
