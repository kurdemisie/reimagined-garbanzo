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
    
    static func getPortion(ingredient:Ingredient, recipeServings:Int, targetServings:Int) -> String {
        //get a single serving size
        //get target portion
        //make it look nice
        
        var portion = ""
        var numerator = ingredient.num ?? 1 //if this is nil, default value is 1
        var denominator = ingredient.denom ?? 1
        var plural = false
        
        //we want to do all these calculations only if there's something to calculate
        if (ingredient.num != nil) {
            //get a single serving size by dividing by amount of servings / multiplying denominator by it
            denominator *= recipeServings
            
            //target portion
            numerator *= targetServings
            
            //reduce fraction by greatest common divisor
            let divisor = Rational.greatestCommonDivisor(Int(numerator), Int(denominator))
            
            numerator /= divisor
            denominator /= divisor
            
            //check if there are whole portions
            if (numerator >= denominator) {
                if (numerator > denominator) { plural = true }
                portion = String(numerator/denominator)
                //checking what's left
                numerator %= denominator
            }
            
            if (numerator > 0) {
                portion +=  portion.isEmpty ? "" : " "
                portion += "\(numerator)/\(denominator)"
            }
        }
        
        if var unit = ingredient.unit {
            //calculate appropriate suffix
            if plural {
                if unit.suffix(2) == "ch" {
                    unit += "es"
                }
                else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                }
                else {
                    unit += "s"
                }
            }
            
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            return portion + unit
        }
        
        return portion
    
}
}
