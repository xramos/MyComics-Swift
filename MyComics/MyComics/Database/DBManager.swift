//
//  DBManager.swift
//  MyComics
//
//  Created by Xavier Ramos on 8/4/24.
//

import Foundation
import CoreData

class DBManager {
    
    // MARK: - Properties
    
    let coreDataStack: CoreDataStack
    
    // MARK: - Methods
    
    init(coreDataStack: CoreDataStack = CoreDataStack.sharedInstance) {
        
        self.coreDataStack = coreDataStack
    }
}

extension DBManager: Persistence {

    func saveCharacter(character: Character) {
        
        if !existCharacter(character: character) {
            
            let dbImage = DBImage(context: coreDataStack.managedContext)
            dbImage.id = UUID()
            dbImage.smallUrl = character.image?.smallUrl
            dbImage.superUrl = character.image?.superUrl
            dbImage.thumbUrl = character.image?.thumbUrl
            
            let dbCharacter = DBCharacter(context: coreDataStack.managedContext)
            dbCharacter.id = Int32(character.id)
            dbCharacter.characterId = Int32(character.id)
            dbCharacter.name = character.name
            dbCharacter.realName = character.realName
            dbCharacter.aliases = character.aliases
            dbCharacter.birth = character.birth
            dbCharacter.deck = character.deck
            dbCharacter.gender = Int16(character.gender.rawValue)
            dbCharacter.origin = character.origin
            
            dbCharacter.image = dbImage
            
            for power in character.powers {
                let dbPower = DBPower(context: coreDataStack.managedContext)
                dbPower.id = Int32(power.id)
                dbPower.name = power.name
                dbPower.character = dbCharacter
            }
            
            coreDataStack.saveContext()
        }
    }
    
    func removeCharacter(character: Character) {
        
        let characterId = Int32(character.id)
        
        let fetchRequest = NSFetchRequest<DBCharacter>(entityName: "DBCharacter")
        fetchRequest.predicate = NSPredicate(format: "characterId==\(characterId)")
        
        do {
            
            let dbCharacters = try coreDataStack.managedContext.fetch(fetchRequest)
            
            for dbCharacter in dbCharacters {
                coreDataStack.managedContext.delete(dbCharacter)
            }
            
            coreDataStack.saveContext()
            
        } catch let error as NSError {
            
            print("Could not fetch for delete. \(error), \(error.userInfo)")
        }
    }
    
    func getCharacter(id: Int) -> Character? {
        
        let characters = getCharacters()
        
        for character in characters where character.id == id {
            
            return character
        }
        
        return nil
    }
    
    func existCharacter(character: Character) -> Bool {
        
        return getCharacter(id: character.id) != nil
    }
    
    func getCharacters() -> [Character] {
        
        var characters: [Character] = []
        
        let fetchRequest = NSFetchRequest<DBCharacter>(entityName: "DBCharacter")
        
        do {
            
            let dbCharacters = try coreDataStack.managedContext.fetch(fetchRequest)
            
            for dbCharacter in dbCharacters {
                let character = dbCharacter.convertToEntity()
                characters.append(character)
            }
            
        } catch let error as NSError {
            
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        return characters
    }
}
