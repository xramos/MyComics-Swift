//
//  Character.swift
//  MyComics
//
//  Created by Xavier Ramos on 3/4/24.
//

import Foundation

struct Character: Identifiable {
    
    let id: Int
    let name: String
    let realName: String
    let aliases: String
    let image: ImageModel?
    let birth: String
    let deck: String
    let gender: Gender
    let origin: String
    let powers: [Power]
    
    func getGender() -> String {

        return gender.description
    }
    
    func getPowers() -> String {
        
        var result = ""
        
        for power in powers {
            
            result = "\(result), \(power.name)"
        }
        
        if powers.count > 0 {
        
            result.remove(at: result.startIndex)
            result.remove(at: result.startIndex)
        }
        
        return result
    }
}
