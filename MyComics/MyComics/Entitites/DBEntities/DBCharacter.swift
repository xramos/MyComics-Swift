//
//  DBCharacter.swift
//  MyComics
//
//  Created by Xavier Ramos on 8/4/24.
//

import Foundation

extension DBCharacter {
    
    func convertToEntity() -> Character {
        
        let imageModel = image?.convertToEntity()
        
        var pows: [Power] = []
        
        if let powers = powers, let dbPowers = powers.allObjects as? [DBPower] {
            
            pows = dbPowers.map({ $0.convertToEntity()})
        }
        
        return Character(id: Int(characterId),
                         name: name ?? "",
                         realName: realName ?? "",
                         aliases: aliases ?? "",
                         image: imageModel,
                         birth: birth ?? "",
                         deck: deck ?? "",
                         gender: Gender(rawValue: Int(gender)) ?? .other,
                         origin: origin ?? "",
                         powers: pows)
    }
}
