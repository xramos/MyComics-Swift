//
//  Persistence.swift
//  MyComics
//
//  Created by Xavier Ramos on 8/4/24.
//

import Foundation

protocol Persistence {
    
    /**
     Save character in DB
     */
    func saveCharacter(character: Character)
    
    /**
     Remove character from DB
     */
    func removeCharacter(character: Character)
    
    /**
    Check if character exists in DB
     */
    func existCharacter(character: Character) -> Bool
    
    /**
     Get all characters from DB
     */
    func getCharacters() -> [Character]
    
    /**
     Get character by specified id if found
     */
    func getCharacter(id: Int) -> Character?
}
