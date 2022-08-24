//
//  Ingredient.swift
//  Recipe_List_App (iOS)
//
//  Created by Monika on 24.8.2022.
//

import Foundation

class Ingredient: Identifiable, Decodable {
    
    var id:UUID?
    var name:String
    var num: Int?
    var denum:Int?
    var unit:String?
}
