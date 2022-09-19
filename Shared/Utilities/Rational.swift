//
//  Rational.swift
//  Recipe_List_App (iOS)
//
//  Created by Monika on 15.9.2022.
//

import Foundation

struct Rational {
    
    static func greatestCommonDivisor(_ a:Int, _ b:Int) -> Int{
        
        if a == 0 {
            return b
        }
            
        if b == 0 {
            return a
        }
            
        return greatestCommonDivisor(b, a % b)
    }
    
}
