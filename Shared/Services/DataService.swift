//
//  DataService.swift
//  Recipe_List_App (iOS)
//
//  Created by Monika on 17.1.2022.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        
        //Parse local json file
        //Get a url path to the json file
        //Create a url object
        //Create a data object
        //Decode the data with the json decoder
        //add id
        //Return recipes
        
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        //check if pathString is not nil, OTHERWISE...
        guard pathString != nil else {
            return [Recipe]()
        }
        
        let url = URL(fileURLWithPath: pathString!)
        
        do{
            let data = try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            do {
                let recipesData = try decoder.decode([Recipe].self, from: data)
                
                for r in recipesData {
                    r.id = UUID()
                }
               return recipesData
            }
            catch {
                print(error)
            }
        }
        catch {
            print(error)
        }
        return [Recipe]()
    }
    
}
