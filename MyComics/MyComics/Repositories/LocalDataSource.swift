//
//  LocalDataSource.swift
//  MyComics
//
//  Created by Xavier Ramos on 8/4/24.
//

import Foundation

class LocalDataSource {
    
    private let dbManager: Persistence
    
    init(dbManager: Persistence = DBManager()) {
        
        self.dbManager = dbManager
    }
    
    func saveCharacter(character: Character) {
        
        dbManager.saveCharacter(character: character)
    }
    
    func removeCharacter(character: Character) {
        
        dbManager.removeCharacter(character: character)
    }
    
    func existCharacter(character: Character) -> Bool {
        
        return dbManager.existCharacter(character: character)
    }
    
    func getCharacters() -> [Character] {
        
        return dbManager.getCharacters()
    }
    
    func getCharacter(id: Int) -> Character? {
        
        return dbManager.getCharacter(id: id)
    }
}
